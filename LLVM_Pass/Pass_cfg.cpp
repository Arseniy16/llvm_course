#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
using namespace llvm;

namespace {
struct MyPass : public FunctionPass {
  static char ID;
  MyPass() : FunctionPass(ID) {}

  bool isFuncLogger(StringRef name) {
    return name == "instrLogger";
  }

  virtual bool runOnFunction(Function &F) {
    if (isFuncLogger(F.getName())) {
      return false;
    }
    // Dump Function
    outs() << "In a function called " << F.getName() << "\n\n";

    for (auto &B : F) {
      for (auto &I : B) {
        // Dump Instructions
        outs() << "Instruction: " << (uint64_t)(&I) << "\n";
        I.print(outs(), true);
        outs() << "\n";
      }
      outs() << "\n";
    }

    // Prepare builder for IR modification
    LLVMContext &Ctx = F.getContext();
    IRBuilder<> builder(Ctx);
    Type *retType = Type::getVoidTy(Ctx);

    // Prepare instrLogger function
    ArrayRef<Type *> instrParamTypes = {
        builder.getInt8Ty()->getPointerTo(), Type::getInt64Ty(Ctx)};
    FunctionType *instrLogFuncType =
        FunctionType::get(retType, instrParamTypes, false);
    FunctionCallee instrLogFunc =
        F.getParent()->getOrInsertFunction("instrLogger", instrLogFuncType);

    for (auto &B : F) {
      for (auto &I : B) {

        // Skip PHI Nodes
        if (auto *phi = dyn_cast<PHINode>(&I)) {
          continue;
        }

        // Insert before instruction
        builder.SetInsertPoint(&I);

        // Insert a call to instrLogFunc function
        Value *opName = builder.CreateGlobalStringPtr(I.getOpcodeName());
        if (opName) {
          Value *args[] = {opName};
          builder.CreateCall(instrLogFunc, args);  
        } 
      }
    }
    return true;
  }
};
} // namespace

char MyPass::ID = 0;

// Automatically enable the pass.
// http://adriansampson.net/blog/clangpass.html
static void registerMyPass(const PassManagerBuilder &,
                                 legacy::PassManagerBase &PM) {
  PM.add(new MyPass());
}
static RegisterStandardPasses
    RegisterMyPass(PassManagerBuilder::EP_OptimizerLast,
                   registerMyPass);
