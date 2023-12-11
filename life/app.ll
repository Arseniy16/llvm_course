; ModuleID = 'app.cc'
source_filename = "app.cc"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.direction = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly
define dso_local void @_Z11simSetPixeljj5colorPj(i32 noundef %0, i32 noundef %1, i64 %2, i32 %3, i32* nocapture noundef writeonly %4) local_unnamed_addr #0 {
  %6 = trunc i64 %2 to i32
  %7 = lshr i64 %2, 32
  %8 = trunc i64 %7 to i32
  %9 = mul i32 %1, 400
  %10 = add i32 %9, %0
  %11 = mul i32 %10, 3
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32* %4, i64 %12
  store i32 %6, i32* %13, align 4, !tbaa !5
  %14 = add i32 %11, 1
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32* %4, i64 %15
  store i32 %8, i32* %16, align 4, !tbaa !5
  %17 = add i32 %11, 2
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32* %4, i64 %18
  store i32 %3, i32* %19, align 4, !tbaa !5
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress uwtable
define dso_local void @_Z8initGamePjS_(i32* nocapture noundef %0, i32* nocapture noundef writeonly %1) local_unnamed_addr #2 {
  br label %3

3:                                                ; preds = %2, %5
  %4 = phi i64 [ 0, %2 ], [ %6, %5 ]
  br label %8

5:                                                ; preds = %8
  %6 = add nuw nsw i64 %4, 1
  %7 = icmp eq i64 %6, 400
  br i1 %7, label %29, label %3, !llvm.loop !9

8:                                                ; preds = %8, %3
  %9 = phi i64 [ 0, %3 ], [ %27, %8 ]
  %10 = mul nuw nsw i64 %9, 400
  %11 = add nuw nsw i64 %10, %4
  %12 = mul nuw nsw i64 %11, 3
  %13 = getelementptr inbounds i32, i32* %0, i64 %12
  store i32 0, i32* %13, align 4, !tbaa !5
  %14 = add nuw nsw i64 %12, 1
  %15 = getelementptr inbounds i32, i32* %0, i64 %14
  store i32 0, i32* %15, align 4, !tbaa !5
  %16 = add nuw nsw i64 %12, 2
  %17 = getelementptr inbounds i32, i32* %0, i64 %16
  store i32 255, i32* %17, align 4, !tbaa !5
  %18 = or i64 %9, 1
  %19 = mul nuw nsw i64 %18, 400
  %20 = add nuw nsw i64 %19, %4
  %21 = mul nuw nsw i64 %20, 3
  %22 = getelementptr inbounds i32, i32* %0, i64 %21
  store i32 0, i32* %22, align 4, !tbaa !5
  %23 = add nuw nsw i64 %21, 1
  %24 = getelementptr inbounds i32, i32* %0, i64 %23
  store i32 0, i32* %24, align 4, !tbaa !5
  %25 = add nuw nsw i64 %21, 2
  %26 = getelementptr inbounds i32, i32* %0, i64 %25
  store i32 255, i32* %26, align 4, !tbaa !5
  %27 = add nuw nsw i64 %9, 2
  %28 = icmp eq i64 %27, 300
  br i1 %28, label %5, label %8, !llvm.loop !11

29:                                               ; preds = %5, %29
  %30 = phi i32 [ %47, %29 ], [ 0, %5 ]
  %31 = tail call noundef i32 @_Z7simRandv()
  %32 = srem i32 %31, 399
  %33 = tail call noundef i32 @_Z7simRandv()
  %34 = srem i32 %33, 299
  %35 = mul nsw i32 %34, 400
  %36 = add nsw i32 %35, %32
  %37 = mul nsw i32 %36, 3
  %38 = add nsw i32 %37, 1203
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32* %0, i64 %39
  store i32 255, i32* %40, align 4, !tbaa !5
  %41 = add nsw i32 %37, 1204
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32* %0, i64 %42
  store i32 0, i32* %43, align 4, !tbaa !5
  %44 = add nsw i32 %37, 1205
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32* %0, i64 %45
  store i32 0, i32* %46, align 4, !tbaa !5
  %47 = add nuw nsw i32 %30, 1
  %48 = icmp eq i32 %47, 10000
  br i1 %48, label %49, label %29, !llvm.loop !12

49:                                               ; preds = %29, %49
  %50 = phi i64 [ %75, %49 ], [ 0, %29 ]
  %51 = mul nuw nsw i64 %50, 3
  %52 = getelementptr inbounds i32, i32* %0, i64 %51
  %53 = load i32, i32* %52, align 4, !tbaa !5
  %54 = add nuw nsw i64 %51, 1
  %55 = getelementptr inbounds i32, i32* %0, i64 %54
  %56 = load i32, i32* %55, align 4, !tbaa !5
  %57 = add nuw nsw i64 %51, 2
  %58 = getelementptr inbounds i32, i32* %0, i64 %57
  %59 = load i32, i32* %58, align 4, !tbaa !5
  %60 = getelementptr inbounds i32, i32* %1, i64 %51
  store i32 %53, i32* %60, align 4, !tbaa !5
  %61 = getelementptr inbounds i32, i32* %1, i64 %54
  store i32 %56, i32* %61, align 4, !tbaa !5
  %62 = getelementptr inbounds i32, i32* %1, i64 %57
  store i32 %59, i32* %62, align 4, !tbaa !5
  %63 = add nuw nsw i64 %51, 358800
  %64 = getelementptr inbounds i32, i32* %0, i64 %63
  %65 = load i32, i32* %64, align 4, !tbaa !5
  %66 = add nuw nsw i64 %51, 358801
  %67 = getelementptr inbounds i32, i32* %0, i64 %66
  %68 = load i32, i32* %67, align 4, !tbaa !5
  %69 = add nuw nsw i64 %51, 358802
  %70 = getelementptr inbounds i32, i32* %0, i64 %69
  %71 = load i32, i32* %70, align 4, !tbaa !5
  %72 = getelementptr inbounds i32, i32* %1, i64 %63
  store i32 %65, i32* %72, align 4, !tbaa !5
  %73 = getelementptr inbounds i32, i32* %1, i64 %66
  store i32 %68, i32* %73, align 4, !tbaa !5
  %74 = getelementptr inbounds i32, i32* %1, i64 %69
  store i32 %71, i32* %74, align 4, !tbaa !5
  %75 = add nuw nsw i64 %50, 1
  %76 = icmp eq i64 %75, 400
  br i1 %76, label %78, label %49, !llvm.loop !13

77:                                               ; preds = %78
  ret void

78:                                               ; preds = %49, %78
  %79 = phi i64 [ %104, %78 ], [ 0, %49 ]
  %80 = mul nuw nsw i64 %79, 1200
  %81 = getelementptr inbounds i32, i32* %0, i64 %80
  %82 = load i32, i32* %81, align 4, !tbaa !5
  %83 = or i64 %80, 1
  %84 = getelementptr inbounds i32, i32* %0, i64 %83
  %85 = load i32, i32* %84, align 4, !tbaa !5
  %86 = or i64 %80, 2
  %87 = getelementptr inbounds i32, i32* %0, i64 %86
  %88 = load i32, i32* %87, align 4, !tbaa !5
  %89 = getelementptr inbounds i32, i32* %1, i64 %80
  store i32 %82, i32* %89, align 4, !tbaa !5
  %90 = getelementptr inbounds i32, i32* %1, i64 %83
  store i32 %85, i32* %90, align 4, !tbaa !5
  %91 = getelementptr inbounds i32, i32* %1, i64 %86
  store i32 %88, i32* %91, align 4, !tbaa !5
  %92 = add nuw nsw i64 %80, 1197
  %93 = getelementptr inbounds i32, i32* %0, i64 %92
  %94 = load i32, i32* %93, align 4, !tbaa !5
  %95 = add nuw nsw i64 %80, 1198
  %96 = getelementptr inbounds i32, i32* %0, i64 %95
  %97 = load i32, i32* %96, align 4, !tbaa !5
  %98 = add nuw nsw i64 %80, 1199
  %99 = getelementptr inbounds i32, i32* %0, i64 %98
  %100 = load i32, i32* %99, align 4, !tbaa !5
  %101 = getelementptr inbounds i32, i32* %1, i64 %92
  store i32 %94, i32* %101, align 4, !tbaa !5
  %102 = getelementptr inbounds i32, i32* %1, i64 %95
  store i32 %97, i32* %102, align 4, !tbaa !5
  %103 = getelementptr inbounds i32, i32* %1, i64 %98
  store i32 %100, i32* %103, align 4, !tbaa !5
  %104 = add nuw nsw i64 %79, 1
  %105 = icmp eq i64 %104, 300
  br i1 %105, label %77, label %78, !llvm.loop !14
}

declare noundef i32 @_Z7simRandv() local_unnamed_addr #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn
define dso_local noundef i32 @_Z6isSame5colorS_(i64 %0, i32 %1, i64 %2, i32 %3) local_unnamed_addr #4 {
  %5 = trunc i64 %0 to i32
  %6 = trunc i64 %2 to i32
  %7 = icmp eq i32 %5, %6
  br i1 %7, label %8, label %16

8:                                                ; preds = %4
  %9 = lshr i64 %2, 32
  %10 = trunc i64 %9 to i32
  %11 = lshr i64 %0, 32
  %12 = trunc i64 %11 to i32
  %13 = icmp eq i32 %12, %10
  %14 = icmp eq i32 %1, %3
  %15 = select i1 %13, i1 %14, i1 false
  br i1 %15, label %17, label %16

16:                                               ; preds = %8, %4
  br label %17

17:                                               ; preds = %8, %16
  %18 = phi i32 [ 0, %16 ], [ 1, %8 ]
  ret i32 %18
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn
define dso_local noundef i32 @_Z18getAliveNeighboursPjS_9direction(i32* noundef readonly %0, i32* nocapture readnone %1, %struct.direction* nocapture noundef readonly byval(%struct.direction) align 8 %2) local_unnamed_addr #5 {
  %4 = getelementptr inbounds %struct.direction, %struct.direction* %2, i64 0, i32 1
  %5 = load i32, i32* %4, align 4, !tbaa !15
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds i32, i32* %0, i64 %6
  %8 = load i32, i32* %7, align 4, !tbaa !5
  %9 = getelementptr inbounds %struct.direction, %struct.direction* %2, i64 0, i32 2
  %10 = load i32, i32* %9, align 8, !tbaa !17
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32* %0, i64 %11
  %13 = load i32, i32* %12, align 4, !tbaa !5
  %14 = add i32 %10, 1
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32* %0, i64 %15
  %17 = load i32, i32* %16, align 4, !tbaa !5
  %18 = add i32 %10, 2
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32* %0, i64 %19
  %21 = load i32, i32* %20, align 4, !tbaa !5
  %22 = getelementptr inbounds %struct.direction, %struct.direction* %2, i64 0, i32 3
  %23 = load i32, i32* %22, align 4, !tbaa !18
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32* %0, i64 %24
  %26 = load i32, i32* %25, align 4, !tbaa !5
  %27 = add i32 %23, 1
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32* %0, i64 %28
  %30 = load i32, i32* %29, align 4, !tbaa !5
  %31 = add i32 %23, 2
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32* %0, i64 %32
  %34 = load i32, i32* %33, align 4, !tbaa !5
  %35 = getelementptr inbounds %struct.direction, %struct.direction* %2, i64 0, i32 4
  %36 = load i32, i32* %35, align 8, !tbaa !19
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32* %0, i64 %37
  %39 = load i32, i32* %38, align 4, !tbaa !5
  %40 = add i32 %36, 1
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32* %0, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !5
  %44 = add i32 %36, 2
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32* %0, i64 %45
  %47 = load i32, i32* %46, align 4, !tbaa !5
  %48 = getelementptr inbounds %struct.direction, %struct.direction* %2, i64 0, i32 5
  %49 = load i32, i32* %48, align 4, !tbaa !20
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32* %0, i64 %50
  %52 = load i32, i32* %51, align 4, !tbaa !5
  %53 = add i32 %49, 1
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32* %0, i64 %54
  %56 = load i32, i32* %55, align 4, !tbaa !5
  %57 = add i32 %49, 2
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds i32, i32* %0, i64 %58
  %60 = load i32, i32* %59, align 4, !tbaa !5
  %61 = getelementptr inbounds %struct.direction, %struct.direction* %2, i64 0, i32 6
  %62 = load i32, i32* %61, align 8, !tbaa !21
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32* %0, i64 %63
  %65 = load i32, i32* %64, align 4, !tbaa !5
  %66 = add i32 %62, 1
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32* %0, i64 %67
  %69 = load i32, i32* %68, align 4, !tbaa !5
  %70 = add i32 %62, 2
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32* %0, i64 %71
  %73 = load i32, i32* %72, align 4, !tbaa !5
  %74 = getelementptr inbounds %struct.direction, %struct.direction* %2, i64 0, i32 7
  %75 = load i32, i32* %74, align 4, !tbaa !22
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds i32, i32* %0, i64 %76
  %78 = load i32, i32* %77, align 4, !tbaa !5
  %79 = add i32 %75, 1
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32* %0, i64 %80
  %82 = load i32, i32* %81, align 4, !tbaa !5
  %83 = add i32 %75, 2
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds i32, i32* %0, i64 %84
  %86 = load i32, i32* %85, align 4, !tbaa !5
  %87 = getelementptr inbounds %struct.direction, %struct.direction* %2, i64 0, i32 8
  %88 = load i32, i32* %87, align 8, !tbaa !23
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32* %0, i64 %89
  %91 = load i32, i32* %90, align 4, !tbaa !5
  %92 = add i32 %88, 1
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds i32, i32* %0, i64 %93
  %95 = load i32, i32* %94, align 4, !tbaa !5
  %96 = add i32 %88, 2
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32* %0, i64 %97
  %99 = load i32, i32* %98, align 4, !tbaa !5
  %100 = icmp eq i32 %8, 255
  br i1 %100, label %101, label %113

101:                                              ; preds = %3
  %102 = add i32 %5, 1
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32* %0, i64 %103
  %105 = load i32, i32* %104, align 4, !tbaa !5
  %106 = add i32 %5, 2
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32* %0, i64 %107
  %109 = load i32, i32* %108, align 4, !tbaa !5
  %110 = icmp eq i32 %105, 0
  %111 = icmp eq i32 %109, 0
  %112 = select i1 %110, i1 %111, i1 false
  br i1 %112, label %114, label %113

113:                                              ; preds = %3, %101
  br label %114

114:                                              ; preds = %101, %113
  %115 = phi i32 [ 0, %113 ], [ 1, %101 ]
  %116 = icmp eq i32 %13, 255
  br i1 %116, label %117, label %123

117:                                              ; preds = %114
  %118 = icmp eq i32 %17, 0
  %119 = icmp eq i32 %21, 0
  %120 = select i1 %118, i1 %119, i1 false
  %121 = zext i1 %120 to i32
  %122 = add nuw nsw i32 %115, %121
  br label %123

123:                                              ; preds = %117, %114
  %124 = phi i32 [ %115, %114 ], [ %122, %117 ]
  %125 = icmp eq i32 %26, 255
  br i1 %125, label %126, label %132

126:                                              ; preds = %123
  %127 = icmp eq i32 %30, 0
  %128 = icmp eq i32 %34, 0
  %129 = select i1 %127, i1 %128, i1 false
  %130 = zext i1 %129 to i32
  %131 = add nuw nsw i32 %124, %130
  br label %132

132:                                              ; preds = %126, %123
  %133 = phi i32 [ %124, %123 ], [ %131, %126 ]
  %134 = icmp eq i32 %39, 255
  br i1 %134, label %135, label %141

135:                                              ; preds = %132
  %136 = icmp eq i32 %43, 0
  %137 = icmp eq i32 %47, 0
  %138 = select i1 %136, i1 %137, i1 false
  %139 = zext i1 %138 to i32
  %140 = add nuw nsw i32 %133, %139
  br label %141

141:                                              ; preds = %135, %132
  %142 = phi i32 [ %133, %132 ], [ %140, %135 ]
  %143 = icmp eq i32 %52, 255
  br i1 %143, label %144, label %150

144:                                              ; preds = %141
  %145 = icmp eq i32 %56, 0
  %146 = icmp eq i32 %60, 0
  %147 = select i1 %145, i1 %146, i1 false
  %148 = zext i1 %147 to i32
  %149 = add nuw nsw i32 %142, %148
  br label %150

150:                                              ; preds = %144, %141
  %151 = phi i32 [ %142, %141 ], [ %149, %144 ]
  %152 = icmp eq i32 %65, 255
  br i1 %152, label %153, label %159

153:                                              ; preds = %150
  %154 = icmp eq i32 %69, 0
  %155 = icmp eq i32 %73, 0
  %156 = select i1 %154, i1 %155, i1 false
  %157 = zext i1 %156 to i32
  %158 = add nuw nsw i32 %151, %157
  br label %159

159:                                              ; preds = %153, %150
  %160 = phi i32 [ %151, %150 ], [ %158, %153 ]
  %161 = icmp eq i32 %78, 255
  br i1 %161, label %162, label %168

162:                                              ; preds = %159
  %163 = icmp eq i32 %82, 0
  %164 = icmp eq i32 %86, 0
  %165 = select i1 %163, i1 %164, i1 false
  %166 = zext i1 %165 to i32
  %167 = add nuw nsw i32 %160, %166
  br label %168

168:                                              ; preds = %162, %159
  %169 = phi i32 [ %160, %159 ], [ %167, %162 ]
  %170 = icmp eq i32 %91, 255
  br i1 %170, label %171, label %177

171:                                              ; preds = %168
  %172 = icmp eq i32 %95, 0
  %173 = icmp eq i32 %99, 0
  %174 = select i1 %172, i1 %173, i1 false
  %175 = zext i1 %174 to i32
  %176 = add nuw nsw i32 %169, %175
  br label %177

177:                                              ; preds = %171, %168
  %178 = phi i32 [ %169, %168 ], [ %176, %171 ]
  ret i32 %178
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z10gameUpdatePjS_(i32* noundef %0, i32* nocapture noundef writeonly %1) local_unnamed_addr #6 {
  %3 = alloca %struct.direction, align 8
  %4 = getelementptr inbounds %struct.direction, %struct.direction* %3, i64 0, i32 0
  %5 = getelementptr inbounds %struct.direction, %struct.direction* %3, i64 0, i32 1
  %6 = getelementptr inbounds %struct.direction, %struct.direction* %3, i64 0, i32 2
  %7 = getelementptr inbounds %struct.direction, %struct.direction* %3, i64 0, i32 3
  %8 = getelementptr inbounds %struct.direction, %struct.direction* %3, i64 0, i32 4
  %9 = getelementptr inbounds %struct.direction, %struct.direction* %3, i64 0, i32 5
  %10 = getelementptr inbounds %struct.direction, %struct.direction* %3, i64 0, i32 6
  %11 = getelementptr inbounds %struct.direction, %struct.direction* %3, i64 0, i32 7
  %12 = getelementptr inbounds %struct.direction, %struct.direction* %3, i64 0, i32 8
  br label %13

13:                                               ; preds = %2, %18
  %14 = phi i64 [ 1, %2 ], [ %16, %18 ]
  %15 = add nsw i64 %14, -1
  %16 = add nuw nsw i64 %14, 1
  br label %20

17:                                               ; preds = %18
  ret void

18:                                               ; preds = %78
  %19 = icmp eq i64 %16, 399
  br i1 %19, label %17, label %13, !llvm.loop !24

20:                                               ; preds = %13, %78
  %21 = phi i64 [ 1, %13 ], [ %27, %78 ]
  %22 = mul nuw nsw i64 %21, 400
  %23 = add nuw nsw i64 %22, %14
  %24 = mul nuw nsw i64 %23, 3
  %25 = add nsw i64 %22, -400
  %26 = add nuw nsw i64 %25, %14
  %27 = add nuw nsw i64 %21, 1
  %28 = mul nuw nsw i64 %27, 400
  %29 = add nuw nsw i64 %28, %14
  %30 = add nuw nsw i64 %22, %15
  %31 = add nuw nsw i64 %22, %16
  %32 = add nuw nsw i64 %25, %15
  %33 = add nuw nsw i64 %25, %16
  %34 = add nuw nsw i64 %28, %15
  %35 = add nuw nsw i64 %28, %16
  %36 = getelementptr inbounds i32, i32* %0, i64 %24
  %37 = load i32, i32* %36, align 4, !tbaa !5
  %38 = add nuw nsw i64 %24, 1
  %39 = getelementptr inbounds i32, i32* %0, i64 %38
  %40 = load i32, i32* %39, align 4, !tbaa !5
  %41 = add nuw nsw i64 %24, 2
  %42 = getelementptr inbounds i32, i32* %0, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !5
  %44 = trunc i64 %24 to i32
  store i32 %44, i32* %4, align 8, !tbaa.struct !25
  %45 = trunc i64 %26 to i32
  %46 = mul i32 %45, 3
  store i32 %46, i32* %5, align 4, !tbaa.struct !26
  %47 = trunc i64 %29 to i32
  %48 = mul i32 %47, 3
  store i32 %48, i32* %6, align 8, !tbaa.struct !27
  %49 = trunc i64 %30 to i32
  %50 = mul i32 %49, 3
  store i32 %50, i32* %7, align 4, !tbaa.struct !28
  %51 = trunc i64 %31 to i32
  %52 = mul i32 %51, 3
  store i32 %52, i32* %8, align 8, !tbaa.struct !29
  %53 = trunc i64 %32 to i32
  %54 = mul i32 %53, 3
  store i32 %54, i32* %9, align 4, !tbaa.struct !30
  %55 = trunc i64 %33 to i32
  %56 = mul i32 %55, 3
  store i32 %56, i32* %10, align 8, !tbaa.struct !31
  %57 = trunc i64 %34 to i32
  %58 = mul i32 %57, 3
  store i32 %58, i32* %11, align 4, !tbaa.struct !32
  %59 = trunc i64 %35 to i32
  %60 = mul i32 %59, 3
  store i32 %60, i32* %12, align 8, !tbaa.struct !33
  %61 = tail call noundef i32 @_Z18getAliveNeighboursPjS_9direction(i32* noundef %0, i32* undef, %struct.direction* noundef nonnull byval(%struct.direction) align 8 %3), !range !34
  %62 = icmp eq i32 %37, 255
  br i1 %62, label %63, label %73

63:                                               ; preds = %20
  %64 = icmp eq i32 %40, 0
  %65 = icmp eq i32 %43, 0
  %66 = select i1 %64, i1 %65, i1 false
  br i1 %66, label %67, label %73

67:                                               ; preds = %63
  %68 = and i32 %61, 14
  %69 = icmp eq i32 %68, 2
  %70 = getelementptr inbounds i32, i32* %1, i64 %24
  br i1 %69, label %72, label %71

71:                                               ; preds = %67
  store i32 0, i32* %70, align 4, !tbaa !5
  br label %78

72:                                               ; preds = %67
  store i32 255, i32* %70, align 4, !tbaa !5
  br label %78

73:                                               ; preds = %20, %63
  %74 = icmp ugt i32 %61, 2
  %75 = getelementptr inbounds i32, i32* %1, i64 %24
  br i1 %74, label %76, label %77

76:                                               ; preds = %73
  store i32 255, i32* %75, align 4, !tbaa !5
  br label %78

77:                                               ; preds = %73
  store i32 0, i32* %75, align 4, !tbaa !5
  br label %78

78:                                               ; preds = %76, %77, %71, %72
  %79 = phi i32 [ 0, %76 ], [ 255, %77 ], [ 255, %71 ], [ 0, %72 ]
  %80 = getelementptr inbounds i32, i32* %1, i64 %38
  store i32 0, i32* %80, align 4, !tbaa !5
  %81 = getelementptr inbounds i32, i32* %1, i64 %41
  store i32 %79, i32* %81, align 4, !tbaa !5
  %82 = icmp eq i64 %27, 299
  br i1 %82, label %18, label %20, !llvm.loop !35
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define dso_local void @_Z8swapDataPPjS0_(i32** nocapture noundef %0, i32** nocapture noundef %1) local_unnamed_addr #7 {
  %3 = load i32*, i32** %0, align 8, !tbaa !36
  %4 = load i32*, i32** %1, align 8, !tbaa !36
  store i32* %4, i32** %0, align 8, !tbaa !36
  store i32* %3, i32** %1, align 8, !tbaa !36
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z8drawGamePjS_(i32* nocapture readnone %0, i32* nocapture noundef readonly %1) local_unnamed_addr #2 {
  br label %3

3:                                                ; preds = %2, %8
  %4 = phi i64 [ 0, %2 ], [ %9, %8 ]
  %5 = mul nuw nsw i64 %4, 400
  %6 = trunc i64 %4 to i32
  br label %11

7:                                                ; preds = %8
  ret void

8:                                                ; preds = %11
  %9 = add nuw nsw i64 %4, 1
  %10 = icmp eq i64 %9, 300
  br i1 %10, label %7, label %3, !llvm.loop !38

11:                                               ; preds = %3, %11
  %12 = phi i64 [ 0, %3 ], [ %28, %11 ]
  %13 = add nuw nsw i64 %12, %5
  %14 = mul nuw nsw i64 %13, 3
  %15 = getelementptr inbounds i32, i32* %1, i64 %14
  %16 = load i32, i32* %15, align 4, !tbaa !5
  %17 = add nuw nsw i64 %14, 1
  %18 = getelementptr inbounds i32, i32* %1, i64 %17
  %19 = load i32, i32* %18, align 4, !tbaa !5
  %20 = add nuw nsw i64 %14, 2
  %21 = getelementptr inbounds i32, i32* %1, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !5
  %23 = zext i32 %19 to i64
  %24 = shl nuw i64 %23, 32
  %25 = zext i32 %16 to i64
  %26 = or i64 %24, %25
  %27 = trunc i64 %12 to i32
  tail call void @_Z9drawPixelii5color(i32 noundef %27, i32 noundef %6, i64 %26, i32 %22)
  %28 = add nuw nsw i64 %12, 1
  %29 = icmp eq i64 %28, 400
  br i1 %29, label %8, label %11, !llvm.loop !39
}

declare void @_Z9drawPixelii5color(i32 noundef, i32 noundef, i64, i32) local_unnamed_addr #3

; Function Attrs: mustprogress noreturn uwtable
define dso_local void @_Z3appv() local_unnamed_addr #8 {
  %1 = alloca [360000 x i32], align 16
  %2 = alloca [360000 x i32], align 16
  %3 = bitcast [360000 x i32]* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 1440000, i8* nonnull %3) #9
  %4 = bitcast [360000 x i32]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 1440000, i8* nonnull %4) #9
  %5 = getelementptr inbounds [360000 x i32], [360000 x i32]* %1, i64 0, i64 0
  %6 = getelementptr inbounds [360000 x i32], [360000 x i32]* %2, i64 0, i64 0
  call void @_Z8initGamePjS_(i32* noundef nonnull %5, i32* noundef nonnull %6)
  br label %7

7:                                                ; preds = %36, %0
  %8 = phi i32* [ %5, %0 ], [ %9, %36 ]
  %9 = phi i32* [ %6, %0 ], [ %8, %36 ]
  call void @_Z10gameUpdatePjS_(i32* noundef nonnull %8, i32* noundef %9)
  br label %10

10:                                               ; preds = %14, %7
  %11 = phi i64 [ 0, %7 ], [ %15, %14 ]
  %12 = mul nuw nsw i64 %11, 400
  %13 = trunc i64 %11 to i32
  br label %17

14:                                               ; preds = %17
  %15 = add nuw nsw i64 %11, 1
  %16 = icmp eq i64 %15, 300
  br i1 %16, label %36, label %10, !llvm.loop !38

17:                                               ; preds = %17, %10
  %18 = phi i64 [ 0, %10 ], [ %34, %17 ]
  %19 = add nuw nsw i64 %18, %12
  %20 = mul nuw nsw i64 %19, 3
  %21 = getelementptr inbounds i32, i32* %9, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !5
  %23 = add nuw nsw i64 %20, 1
  %24 = getelementptr inbounds i32, i32* %9, i64 %23
  %25 = load i32, i32* %24, align 4, !tbaa !5
  %26 = add nuw nsw i64 %20, 2
  %27 = getelementptr inbounds i32, i32* %9, i64 %26
  %28 = load i32, i32* %27, align 4, !tbaa !5
  %29 = zext i32 %25 to i64
  %30 = shl nuw i64 %29, 32
  %31 = zext i32 %22 to i64
  %32 = or i64 %30, %31
  %33 = trunc i64 %18 to i32
  call void @_Z9drawPixelii5color(i32 noundef %33, i32 noundef %13, i64 %32, i32 %28)
  %34 = add nuw nsw i64 %18, 1
  %35 = icmp eq i64 %34, 400
  br i1 %35, label %14, label %17, !llvm.loop !39

36:                                               ; preds = %14
  call void @_Z8simFlushv()
  br label %7, !llvm.loop !40
}

declare void @_Z8simFlushv() local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress noreturn uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
!15 = !{!16, !6, i64 4}
!16 = !{!"_ZTS9direction", !6, i64 0, !6, i64 4, !6, i64 8, !6, i64 12, !6, i64 16, !6, i64 20, !6, i64 24, !6, i64 28, !6, i64 32}
!17 = !{!16, !6, i64 8}
!18 = !{!16, !6, i64 12}
!19 = !{!16, !6, i64 16}
!20 = !{!16, !6, i64 20}
!21 = !{!16, !6, i64 24}
!22 = !{!16, !6, i64 28}
!23 = !{!16, !6, i64 32}
!24 = distinct !{!24, !10}
!25 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5, i64 12, i64 4, !5, i64 16, i64 4, !5, i64 20, i64 4, !5, i64 24, i64 4, !5, i64 28, i64 4, !5, i64 32, i64 4, !5}
!26 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5, i64 12, i64 4, !5, i64 16, i64 4, !5, i64 20, i64 4, !5, i64 24, i64 4, !5, i64 28, i64 4, !5}
!27 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5, i64 12, i64 4, !5, i64 16, i64 4, !5, i64 20, i64 4, !5, i64 24, i64 4, !5}
!28 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5, i64 12, i64 4, !5, i64 16, i64 4, !5, i64 20, i64 4, !5}
!29 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5, i64 12, i64 4, !5, i64 16, i64 4, !5}
!30 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5, i64 12, i64 4, !5}
!31 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5}
!32 = !{i64 0, i64 4, !5, i64 4, i64 4, !5}
!33 = !{i64 0, i64 4, !5}
!34 = !{i32 0, i32 9}
!35 = distinct !{!35, !10}
!36 = !{!37, !37, i64 0}
!37 = !{!"any pointer", !7, i64 0}
!38 = distinct !{!38, !10}
!39 = distinct !{!39, !10}
!40 = distinct !{!40, !10}
