; ModuleID = 'app.cc'
source_filename = "app.cc"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.color = type { i32, i32, i32 }
%struct.direction = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }

@dead = dso_local local_unnamed_addr global %struct.color { i32 0, i32 0, i32 255 }, align 8
@alive = dso_local local_unnamed_addr global %struct.color { i32 255, i32 0, i32 0 }, align 8
@_ZL8prev_gen = internal unnamed_addr global i32* getelementptr inbounds ([1440000 x i32], [1440000 x i32]* @_ZL9data_prev, i64 0, i64 0), align 8
@_ZL8next_gen = internal unnamed_addr global i32* getelementptr inbounds ([1440000 x i32], [1440000 x i32]* @_ZL8data_new, i64 0, i64 0), align 8
@_ZL9data_prev = internal global [1440000 x i32] zeroinitializer, align 16
@_ZL8data_new = internal global [1440000 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly
define dso_local void @_Z11simSetPixeljj5colorPj(i32 noundef %0, i32 noundef %1, i64 %2, i32 %3, i32* nocapture noundef writeonly %4) local_unnamed_addr #0 {
  %6 = trunc i64 %2 to i32
  %7 = lshr i64 %2, 32
  %8 = trunc i64 %7 to i32
  %9 = mul i32 %1, 800
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

; Function Attrs: mustprogress uwtable
define dso_local void @_Z8initGamev() local_unnamed_addr #1 {
  %1 = load i32*, i32** @_ZL8prev_gen, align 8, !tbaa !9
  br label %2

2:                                                ; preds = %0, %4
  %3 = phi i64 [ 0, %0 ], [ %5, %4 ]
  br label %7

4:                                                ; preds = %7
  %5 = add nuw nsw i64 %3, 1
  %6 = icmp eq i64 %5, 800
  br i1 %6, label %26, label %2, !llvm.loop !11

7:                                                ; preds = %2, %7
  %8 = phi i64 [ 0, %2 ], [ %22, %7 ]
  %9 = load i64, i64* bitcast (%struct.color* @dead to i64*), align 8, !tbaa.struct !13
  %10 = load i32, i32* getelementptr inbounds (%struct.color, %struct.color* @dead, i64 0, i32 2), align 8, !tbaa.struct !14
  %11 = trunc i64 %9 to i32
  %12 = lshr i64 %9, 32
  %13 = trunc i64 %12 to i32
  %14 = mul nuw nsw i64 %8, 800
  %15 = add nuw nsw i64 %14, %3
  %16 = mul nuw nsw i64 %15, 3
  %17 = getelementptr inbounds i32, i32* %1, i64 %16
  store i32 %11, i32* %17, align 4, !tbaa !5
  %18 = add nuw nsw i64 %16, 1
  %19 = getelementptr inbounds i32, i32* %1, i64 %18
  store i32 %13, i32* %19, align 4, !tbaa !5
  %20 = add nuw nsw i64 %16, 2
  %21 = getelementptr inbounds i32, i32* %1, i64 %20
  store i32 %10, i32* %21, align 4, !tbaa !5
  %22 = add nuw nsw i64 %8, 1
  %23 = icmp eq i64 %22, 600
  br i1 %23, label %4, label %7, !llvm.loop !15

24:                                               ; preds = %26
  %25 = load i32*, i32** @_ZL8next_gen, align 8, !tbaa !9
  br label %52

26:                                               ; preds = %4, %26
  %27 = phi i32 [ %50, %26 ], [ 0, %4 ]
  %28 = tail call noundef i32 @_Z7simRandv()
  %29 = srem i32 %28, 799
  %30 = tail call noundef i32 @_Z7simRandv()
  %31 = srem i32 %30, 599
  %32 = load i64, i64* bitcast (%struct.color* @alive to i64*), align 8, !tbaa.struct !13
  %33 = load i32, i32* getelementptr inbounds (%struct.color, %struct.color* @alive, i64 0, i32 2), align 8, !tbaa.struct !14
  %34 = load i32*, i32** @_ZL8prev_gen, align 8, !tbaa !9
  %35 = trunc i64 %32 to i32
  %36 = lshr i64 %32, 32
  %37 = trunc i64 %36 to i32
  %38 = mul nsw i32 %31, 800
  %39 = add nsw i32 %38, %29
  %40 = mul nsw i32 %39, 3
  %41 = add nsw i32 %40, 2403
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32* %34, i64 %42
  store i32 %35, i32* %43, align 4, !tbaa !5
  %44 = add nsw i32 %40, 2404
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32* %34, i64 %45
  store i32 %37, i32* %46, align 4, !tbaa !5
  %47 = add nsw i32 %40, 2405
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32* %34, i64 %48
  store i32 %33, i32* %49, align 4, !tbaa !5
  %50 = add nuw nsw i32 %27, 1
  %51 = icmp eq i32 %50, 20000
  br i1 %51, label %24, label %26, !llvm.loop !16

52:                                               ; preds = %24, %52
  %53 = phi i64 [ 0, %24 ], [ %78, %52 ]
  %54 = mul nuw nsw i64 %53, 3
  %55 = getelementptr inbounds i32, i32* %34, i64 %54
  %56 = load i32, i32* %55, align 4, !tbaa !5
  %57 = add nuw nsw i64 %54, 1
  %58 = getelementptr inbounds i32, i32* %34, i64 %57
  %59 = load i32, i32* %58, align 4, !tbaa !5
  %60 = add nuw nsw i64 %54, 2
  %61 = getelementptr inbounds i32, i32* %34, i64 %60
  %62 = load i32, i32* %61, align 4, !tbaa !5
  %63 = getelementptr inbounds i32, i32* %25, i64 %54
  store i32 %56, i32* %63, align 4, !tbaa !5
  %64 = getelementptr inbounds i32, i32* %25, i64 %57
  store i32 %59, i32* %64, align 4, !tbaa !5
  %65 = getelementptr inbounds i32, i32* %25, i64 %60
  store i32 %62, i32* %65, align 4, !tbaa !5
  %66 = add nuw nsw i64 %54, 1437600
  %67 = getelementptr inbounds i32, i32* %34, i64 %66
  %68 = load i32, i32* %67, align 4, !tbaa !5
  %69 = add nuw nsw i64 %54, 1437601
  %70 = getelementptr inbounds i32, i32* %34, i64 %69
  %71 = load i32, i32* %70, align 4, !tbaa !5
  %72 = add nuw nsw i64 %54, 1437602
  %73 = getelementptr inbounds i32, i32* %34, i64 %72
  %74 = load i32, i32* %73, align 4, !tbaa !5
  %75 = getelementptr inbounds i32, i32* %25, i64 %66
  store i32 %68, i32* %75, align 4, !tbaa !5
  %76 = getelementptr inbounds i32, i32* %25, i64 %69
  store i32 %71, i32* %76, align 4, !tbaa !5
  %77 = getelementptr inbounds i32, i32* %25, i64 %72
  store i32 %74, i32* %77, align 4, !tbaa !5
  %78 = add nuw nsw i64 %53, 1
  %79 = icmp eq i64 %78, 800
  br i1 %79, label %81, label %52, !llvm.loop !17

80:                                               ; preds = %81
  ret void

81:                                               ; preds = %52, %81
  %82 = phi i64 [ %107, %81 ], [ 0, %52 ]
  %83 = mul nuw nsw i64 %82, 2400
  %84 = getelementptr inbounds i32, i32* %34, i64 %83
  %85 = load i32, i32* %84, align 4, !tbaa !5
  %86 = or i64 %83, 1
  %87 = getelementptr inbounds i32, i32* %34, i64 %86
  %88 = load i32, i32* %87, align 4, !tbaa !5
  %89 = or i64 %83, 2
  %90 = getelementptr inbounds i32, i32* %34, i64 %89
  %91 = load i32, i32* %90, align 4, !tbaa !5
  %92 = getelementptr inbounds i32, i32* %25, i64 %83
  store i32 %85, i32* %92, align 4, !tbaa !5
  %93 = getelementptr inbounds i32, i32* %25, i64 %86
  store i32 %88, i32* %93, align 4, !tbaa !5
  %94 = getelementptr inbounds i32, i32* %25, i64 %89
  store i32 %91, i32* %94, align 4, !tbaa !5
  %95 = add nuw nsw i64 %83, 2397
  %96 = getelementptr inbounds i32, i32* %34, i64 %95
  %97 = load i32, i32* %96, align 4, !tbaa !5
  %98 = add nuw nsw i64 %83, 2398
  %99 = getelementptr inbounds i32, i32* %34, i64 %98
  %100 = load i32, i32* %99, align 4, !tbaa !5
  %101 = add nuw nsw i64 %83, 2399
  %102 = getelementptr inbounds i32, i32* %34, i64 %101
  %103 = load i32, i32* %102, align 4, !tbaa !5
  %104 = getelementptr inbounds i32, i32* %25, i64 %95
  store i32 %97, i32* %104, align 4, !tbaa !5
  %105 = getelementptr inbounds i32, i32* %25, i64 %98
  store i32 %100, i32* %105, align 4, !tbaa !5
  %106 = getelementptr inbounds i32, i32* %25, i64 %101
  store i32 %103, i32* %106, align 4, !tbaa !5
  %107 = add nuw nsw i64 %82, 1
  %108 = icmp eq i64 %107, 600
  br i1 %108, label %80, label %81, !llvm.loop !18
}

declare noundef i32 @_Z7simRandv() local_unnamed_addr #2

; Function Attrs: mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn
define dso_local noundef i32 @_Z6isSame5colorS_(i64 %0, i32 %1, i64 %2, i32 %3) local_unnamed_addr #3 {
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
define dso_local noundef i32 @_Z18getAliveNeighbours9direction(%struct.direction* nocapture noundef readonly byval(%struct.direction) align 8 %0) local_unnamed_addr #4 {
  %2 = load i32*, i32** @_ZL8prev_gen, align 8, !tbaa !9
  %3 = getelementptr inbounds %struct.direction, %struct.direction* %0, i64 0, i32 1
  %4 = load i32, i32* %3, align 4, !tbaa !19
  %5 = zext i32 %4 to i64
  %6 = getelementptr inbounds i32, i32* %2, i64 %5
  %7 = load i32, i32* %6, align 4, !tbaa !5
  %8 = getelementptr inbounds %struct.direction, %struct.direction* %0, i64 0, i32 2
  %9 = load i32, i32* %8, align 8, !tbaa !21
  %10 = zext i32 %9 to i64
  %11 = getelementptr inbounds i32, i32* %2, i64 %10
  %12 = load i32, i32* %11, align 4, !tbaa !5
  %13 = add i32 %9, 1
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32* %2, i64 %14
  %16 = load i32, i32* %15, align 4, !tbaa !5
  %17 = add i32 %9, 2
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32* %2, i64 %18
  %20 = load i32, i32* %19, align 4, !tbaa !5
  %21 = getelementptr inbounds %struct.direction, %struct.direction* %0, i64 0, i32 3
  %22 = load i32, i32* %21, align 4, !tbaa !22
  %23 = zext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32* %2, i64 %23
  %25 = load i32, i32* %24, align 4, !tbaa !5
  %26 = add i32 %22, 1
  %27 = zext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32* %2, i64 %27
  %29 = load i32, i32* %28, align 4, !tbaa !5
  %30 = add i32 %22, 2
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32* %2, i64 %31
  %33 = load i32, i32* %32, align 4, !tbaa !5
  %34 = getelementptr inbounds %struct.direction, %struct.direction* %0, i64 0, i32 4
  %35 = load i32, i32* %34, align 8, !tbaa !23
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i32, i32* %2, i64 %36
  %38 = load i32, i32* %37, align 4, !tbaa !5
  %39 = add i32 %35, 1
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32* %2, i64 %40
  %42 = load i32, i32* %41, align 4, !tbaa !5
  %43 = add i32 %35, 2
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i32, i32* %2, i64 %44
  %46 = load i32, i32* %45, align 4, !tbaa !5
  %47 = getelementptr inbounds %struct.direction, %struct.direction* %0, i64 0, i32 5
  %48 = load i32, i32* %47, align 4, !tbaa !24
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32* %2, i64 %49
  %51 = load i32, i32* %50, align 4, !tbaa !5
  %52 = add i32 %48, 1
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32* %2, i64 %53
  %55 = load i32, i32* %54, align 4, !tbaa !5
  %56 = add i32 %48, 2
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32* %2, i64 %57
  %59 = load i32, i32* %58, align 4, !tbaa !5
  %60 = getelementptr inbounds %struct.direction, %struct.direction* %0, i64 0, i32 6
  %61 = load i32, i32* %60, align 8, !tbaa !25
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32* %2, i64 %62
  %64 = load i32, i32* %63, align 4, !tbaa !5
  %65 = add i32 %61, 1
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i32, i32* %2, i64 %66
  %68 = load i32, i32* %67, align 4, !tbaa !5
  %69 = add i32 %61, 2
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32* %2, i64 %70
  %72 = load i32, i32* %71, align 4, !tbaa !5
  %73 = getelementptr inbounds %struct.direction, %struct.direction* %0, i64 0, i32 7
  %74 = load i32, i32* %73, align 4, !tbaa !26
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i32, i32* %2, i64 %75
  %77 = load i32, i32* %76, align 4, !tbaa !5
  %78 = add i32 %74, 1
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32* %2, i64 %79
  %81 = load i32, i32* %80, align 4, !tbaa !5
  %82 = add i32 %74, 2
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32* %2, i64 %83
  %85 = load i32, i32* %84, align 4, !tbaa !5
  %86 = getelementptr inbounds %struct.direction, %struct.direction* %0, i64 0, i32 8
  %87 = load i32, i32* %86, align 8, !tbaa !27
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds i32, i32* %2, i64 %88
  %90 = load i32, i32* %89, align 4, !tbaa !5
  %91 = add i32 %87, 1
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32* %2, i64 %92
  %94 = load i32, i32* %93, align 4, !tbaa !5
  %95 = add i32 %87, 2
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds i32, i32* %2, i64 %96
  %98 = load i32, i32* %97, align 4, !tbaa !5
  %99 = load i64, i64* bitcast (%struct.color* @alive to i64*), align 8, !tbaa.struct !13
  %100 = load i32, i32* getelementptr inbounds (%struct.color, %struct.color* @alive, i64 0, i32 2), align 8, !tbaa.struct !14
  %101 = trunc i64 %99 to i32
  %102 = icmp eq i32 %7, %101
  br i1 %102, label %103, label %117

103:                                              ; preds = %1
  %104 = add i32 %4, 1
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i32, i32* %2, i64 %105
  %107 = load i32, i32* %106, align 4, !tbaa !5
  %108 = add i32 %4, 2
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32* %2, i64 %109
  %111 = load i32, i32* %110, align 4, !tbaa !5
  %112 = lshr i64 %99, 32
  %113 = trunc i64 %112 to i32
  %114 = icmp eq i32 %107, %113
  %115 = icmp eq i32 %100, %111
  %116 = select i1 %114, i1 %115, i1 false
  br i1 %116, label %118, label %117

117:                                              ; preds = %1, %103
  br label %118

118:                                              ; preds = %103, %117
  %119 = phi i32 [ 0, %117 ], [ 1, %103 ]
  %120 = icmp eq i32 %12, %101
  br i1 %120, label %121, label %129

121:                                              ; preds = %118
  %122 = lshr i64 %99, 32
  %123 = trunc i64 %122 to i32
  %124 = icmp eq i32 %16, %123
  %125 = icmp eq i32 %100, %20
  %126 = select i1 %124, i1 %125, i1 false
  %127 = zext i1 %126 to i32
  %128 = add nuw nsw i32 %119, %127
  br label %129

129:                                              ; preds = %121, %118
  %130 = phi i32 [ %119, %118 ], [ %128, %121 ]
  %131 = icmp eq i32 %25, %101
  br i1 %131, label %132, label %140

132:                                              ; preds = %129
  %133 = lshr i64 %99, 32
  %134 = trunc i64 %133 to i32
  %135 = icmp eq i32 %29, %134
  %136 = icmp eq i32 %100, %33
  %137 = select i1 %135, i1 %136, i1 false
  %138 = zext i1 %137 to i32
  %139 = add nuw nsw i32 %130, %138
  br label %140

140:                                              ; preds = %132, %129
  %141 = phi i32 [ %130, %129 ], [ %139, %132 ]
  %142 = icmp eq i32 %38, %101
  br i1 %142, label %143, label %151

143:                                              ; preds = %140
  %144 = lshr i64 %99, 32
  %145 = trunc i64 %144 to i32
  %146 = icmp eq i32 %42, %145
  %147 = icmp eq i32 %100, %46
  %148 = select i1 %146, i1 %147, i1 false
  %149 = zext i1 %148 to i32
  %150 = add nuw nsw i32 %141, %149
  br label %151

151:                                              ; preds = %143, %140
  %152 = phi i32 [ %141, %140 ], [ %150, %143 ]
  %153 = icmp eq i32 %51, %101
  br i1 %153, label %154, label %162

154:                                              ; preds = %151
  %155 = lshr i64 %99, 32
  %156 = trunc i64 %155 to i32
  %157 = icmp eq i32 %55, %156
  %158 = icmp eq i32 %100, %59
  %159 = select i1 %157, i1 %158, i1 false
  %160 = zext i1 %159 to i32
  %161 = add nuw nsw i32 %152, %160
  br label %162

162:                                              ; preds = %154, %151
  %163 = phi i32 [ %152, %151 ], [ %161, %154 ]
  %164 = icmp eq i32 %64, %101
  br i1 %164, label %165, label %173

165:                                              ; preds = %162
  %166 = lshr i64 %99, 32
  %167 = trunc i64 %166 to i32
  %168 = icmp eq i32 %68, %167
  %169 = icmp eq i32 %100, %72
  %170 = select i1 %168, i1 %169, i1 false
  %171 = zext i1 %170 to i32
  %172 = add nuw nsw i32 %163, %171
  br label %173

173:                                              ; preds = %165, %162
  %174 = phi i32 [ %163, %162 ], [ %172, %165 ]
  %175 = icmp eq i32 %77, %101
  br i1 %175, label %176, label %184

176:                                              ; preds = %173
  %177 = lshr i64 %99, 32
  %178 = trunc i64 %177 to i32
  %179 = icmp eq i32 %81, %178
  %180 = icmp eq i32 %100, %85
  %181 = select i1 %179, i1 %180, i1 false
  %182 = zext i1 %181 to i32
  %183 = add nuw nsw i32 %174, %182
  br label %184

184:                                              ; preds = %176, %173
  %185 = phi i32 [ %174, %173 ], [ %183, %176 ]
  %186 = icmp eq i32 %90, %101
  br i1 %186, label %187, label %195

187:                                              ; preds = %184
  %188 = lshr i64 %99, 32
  %189 = trunc i64 %188 to i32
  %190 = icmp eq i32 %94, %189
  %191 = icmp eq i32 %100, %98
  %192 = select i1 %190, i1 %191, i1 false
  %193 = zext i1 %192 to i32
  %194 = add nuw nsw i32 %185, %193
  br label %195

195:                                              ; preds = %187, %184
  %196 = phi i32 [ %185, %184 ], [ %194, %187 ]
  ret i32 %196
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z10gameUpdatev() local_unnamed_addr #5 {
  %1 = alloca %struct.direction, align 8
  %2 = load i32*, i32** @_ZL8prev_gen, align 8, !tbaa !9
  %3 = getelementptr inbounds %struct.direction, %struct.direction* %1, i64 0, i32 0
  %4 = getelementptr inbounds %struct.direction, %struct.direction* %1, i64 0, i32 1
  %5 = getelementptr inbounds %struct.direction, %struct.direction* %1, i64 0, i32 2
  %6 = getelementptr inbounds %struct.direction, %struct.direction* %1, i64 0, i32 3
  %7 = getelementptr inbounds %struct.direction, %struct.direction* %1, i64 0, i32 4
  %8 = getelementptr inbounds %struct.direction, %struct.direction* %1, i64 0, i32 5
  %9 = getelementptr inbounds %struct.direction, %struct.direction* %1, i64 0, i32 6
  %10 = getelementptr inbounds %struct.direction, %struct.direction* %1, i64 0, i32 7
  %11 = getelementptr inbounds %struct.direction, %struct.direction* %1, i64 0, i32 8
  br label %12

12:                                               ; preds = %0, %18
  %13 = phi i64 [ 1, %0 ], [ %15, %18 ]
  %14 = add nsw i64 %13, -1
  %15 = add nuw nsw i64 %13, 1
  %16 = load i32*, i32** @_ZL8next_gen, align 8
  br label %20

17:                                               ; preds = %18
  ret void

18:                                               ; preds = %92
  %19 = icmp eq i64 %15, 799
  br i1 %19, label %17, label %12, !llvm.loop !28

20:                                               ; preds = %12, %92
  %21 = phi i64 [ 1, %12 ], [ %27, %92 ]
  %22 = mul nuw nsw i64 %21, 800
  %23 = add nuw nsw i64 %22, %13
  %24 = mul nuw nsw i64 %23, 3
  %25 = add nsw i64 %22, -800
  %26 = add nuw nsw i64 %25, %13
  %27 = add nuw nsw i64 %21, 1
  %28 = mul nuw nsw i64 %27, 800
  %29 = add nuw nsw i64 %28, %13
  %30 = add nuw nsw i64 %22, %14
  %31 = add nuw nsw i64 %22, %15
  %32 = add nuw nsw i64 %25, %14
  %33 = add nuw nsw i64 %25, %15
  %34 = add nuw nsw i64 %28, %14
  %35 = add nuw nsw i64 %28, %15
  %36 = getelementptr inbounds i32, i32* %2, i64 %24
  %37 = load i32, i32* %36, align 4, !tbaa !5
  %38 = add nuw nsw i64 %24, 1
  %39 = getelementptr inbounds i32, i32* %2, i64 %38
  %40 = load i32, i32* %39, align 4, !tbaa !5
  %41 = add nuw nsw i64 %24, 2
  %42 = getelementptr inbounds i32, i32* %2, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !5
  %44 = trunc i64 %24 to i32
  store i32 %44, i32* %3, align 8, !tbaa.struct !29
  %45 = trunc i64 %26 to i32
  %46 = mul i32 %45, 3
  store i32 %46, i32* %4, align 4, !tbaa.struct !30
  %47 = trunc i64 %29 to i32
  %48 = mul i32 %47, 3
  store i32 %48, i32* %5, align 8, !tbaa.struct !31
  %49 = trunc i64 %30 to i32
  %50 = mul i32 %49, 3
  store i32 %50, i32* %6, align 4, !tbaa.struct !32
  %51 = trunc i64 %31 to i32
  %52 = mul i32 %51, 3
  store i32 %52, i32* %7, align 8, !tbaa.struct !33
  %53 = trunc i64 %32 to i32
  %54 = mul i32 %53, 3
  store i32 %54, i32* %8, align 4, !tbaa.struct !34
  %55 = trunc i64 %33 to i32
  %56 = mul i32 %55, 3
  store i32 %56, i32* %9, align 8, !tbaa.struct !13
  %57 = trunc i64 %34 to i32
  %58 = mul i32 %57, 3
  store i32 %58, i32* %10, align 4, !tbaa.struct !35
  %59 = trunc i64 %35 to i32
  %60 = mul i32 %59, 3
  store i32 %60, i32* %11, align 8, !tbaa.struct !14
  %61 = tail call noundef i32 @_Z18getAliveNeighbours9direction(%struct.direction* noundef nonnull byval(%struct.direction) align 8 %1), !range !36
  %62 = load i64, i64* bitcast (%struct.color* @alive to i64*), align 8, !tbaa.struct !13
  %63 = load i32, i32* getelementptr inbounds (%struct.color, %struct.color* @alive, i64 0, i32 2), align 8, !tbaa.struct !14
  %64 = trunc i64 %62 to i32
  %65 = icmp eq i32 %37, %64
  br i1 %65, label %66, label %81

66:                                               ; preds = %20
  %67 = lshr i64 %62, 32
  %68 = trunc i64 %67 to i32
  %69 = icmp eq i32 %40, %68
  %70 = icmp eq i32 %43, %63
  %71 = select i1 %69, i1 %70, i1 false
  br i1 %71, label %72, label %81

72:                                               ; preds = %66
  %73 = and i32 %61, 14
  %74 = icmp eq i32 %73, 2
  br i1 %74, label %92, label %75

75:                                               ; preds = %72
  %76 = load i64, i64* bitcast (%struct.color* @dead to i64*), align 8, !tbaa.struct !13
  %77 = load i32, i32* getelementptr inbounds (%struct.color, %struct.color* @dead, i64 0, i32 2), align 8, !tbaa.struct !14
  %78 = trunc i64 %76 to i32
  %79 = lshr i64 %76, 32
  %80 = trunc i64 %79 to i32
  br label %92

81:                                               ; preds = %20, %66
  %82 = icmp ugt i32 %61, 2
  br i1 %82, label %83, label %86

83:                                               ; preds = %81
  %84 = lshr i64 %62, 32
  %85 = trunc i64 %84 to i32
  br label %92

86:                                               ; preds = %81
  %87 = load i64, i64* bitcast (%struct.color* @dead to i64*), align 8, !tbaa.struct !13
  %88 = load i32, i32* getelementptr inbounds (%struct.color, %struct.color* @dead, i64 0, i32 2), align 8, !tbaa.struct !14
  %89 = trunc i64 %87 to i32
  %90 = lshr i64 %87, 32
  %91 = trunc i64 %90 to i32
  br label %92

92:                                               ; preds = %72, %83, %86, %75
  %93 = phi i32 [ %64, %83 ], [ %89, %86 ], [ %78, %75 ], [ %37, %72 ]
  %94 = phi i32 [ %85, %83 ], [ %91, %86 ], [ %80, %75 ], [ %40, %72 ]
  %95 = phi i32 [ %63, %83 ], [ %88, %86 ], [ %77, %75 ], [ %43, %72 ]
  %96 = getelementptr inbounds i32, i32* %16, i64 %24
  store i32 %93, i32* %96, align 4, !tbaa !5
  %97 = getelementptr inbounds i32, i32* %16, i64 %38
  store i32 %94, i32* %97, align 4, !tbaa !5
  %98 = getelementptr inbounds i32, i32* %16, i64 %41
  store i32 %95, i32* %98, align 4, !tbaa !5
  %99 = icmp eq i64 %27, 599
  br i1 %99, label %18, label %20, !llvm.loop !37
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define dso_local void @_Z8swapDataPPjS0_(i32** nocapture noundef %0, i32** nocapture noundef %1) local_unnamed_addr #6 {
  %3 = load i32*, i32** %0, align 8, !tbaa !9
  %4 = load i32*, i32** %1, align 8, !tbaa !9
  store i32* %4, i32** %0, align 8, !tbaa !9
  store i32* %3, i32** %1, align 8, !tbaa !9
  ret void
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z8drawGamev() local_unnamed_addr #1 {
  br label %1

1:                                                ; preds = %0, %6
  %2 = phi i64 [ 0, %0 ], [ %7, %6 ]
  %3 = mul nuw nsw i64 %2, 800
  %4 = trunc i64 %2 to i32
  br label %9

5:                                                ; preds = %6
  ret void

6:                                                ; preds = %9
  %7 = add nuw nsw i64 %2, 1
  %8 = icmp eq i64 %7, 600
  br i1 %8, label %5, label %1, !llvm.loop !38

9:                                                ; preds = %1, %9
  %10 = phi i64 [ 0, %1 ], [ %27, %9 ]
  %11 = add nuw nsw i64 %10, %3
  %12 = mul nuw nsw i64 %11, 3
  %13 = load i32*, i32** @_ZL8next_gen, align 8, !tbaa !9
  %14 = getelementptr inbounds i32, i32* %13, i64 %12
  %15 = load i32, i32* %14, align 4, !tbaa !5
  %16 = add nuw nsw i64 %12, 1
  %17 = getelementptr inbounds i32, i32* %13, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !5
  %19 = add nuw nsw i64 %12, 2
  %20 = getelementptr inbounds i32, i32* %13, i64 %19
  %21 = load i32, i32* %20, align 4, !tbaa !5
  %22 = zext i32 %18 to i64
  %23 = shl nuw i64 %22, 32
  %24 = zext i32 %15 to i64
  %25 = or i64 %23, %24
  %26 = trunc i64 %10 to i32
  tail call void @_Z9drawPixelii5color(i32 noundef %26, i32 noundef %4, i64 %25, i32 %21)
  %27 = add nuw nsw i64 %10, 1
  %28 = icmp eq i64 %27, 800
  br i1 %28, label %6, label %9, !llvm.loop !39
}

declare void @_Z9drawPixelii5color(i32 noundef, i32 noundef, i64, i32) local_unnamed_addr #2

; Function Attrs: mustprogress noreturn uwtable
define dso_local void @_Z3appv() local_unnamed_addr #7 {
  tail call void @_Z8initGamev()
  br label %1

1:                                                ; preds = %0, %29
  tail call void @_Z10gameUpdatev()
  br label %2

2:                                                ; preds = %6, %1
  %3 = phi i64 [ 0, %1 ], [ %7, %6 ]
  %4 = mul nuw nsw i64 %3, 800
  %5 = trunc i64 %3 to i32
  br label %9

6:                                                ; preds = %9
  %7 = add nuw nsw i64 %3, 1
  %8 = icmp eq i64 %7, 600
  br i1 %8, label %29, label %2, !llvm.loop !38

9:                                                ; preds = %9, %2
  %10 = phi i64 [ 0, %2 ], [ %27, %9 ]
  %11 = add nuw nsw i64 %10, %4
  %12 = mul nuw nsw i64 %11, 3
  %13 = load i32*, i32** @_ZL8next_gen, align 8, !tbaa !9
  %14 = getelementptr inbounds i32, i32* %13, i64 %12
  %15 = load i32, i32* %14, align 4, !tbaa !5
  %16 = add nuw nsw i64 %12, 1
  %17 = getelementptr inbounds i32, i32* %13, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !5
  %19 = add nuw nsw i64 %12, 2
  %20 = getelementptr inbounds i32, i32* %13, i64 %19
  %21 = load i32, i32* %20, align 4, !tbaa !5
  %22 = zext i32 %18 to i64
  %23 = shl nuw i64 %22, 32
  %24 = zext i32 %15 to i64
  %25 = or i64 %23, %24
  %26 = trunc i64 %10 to i32
  tail call void @_Z9drawPixelii5color(i32 noundef %26, i32 noundef %5, i64 %25, i32 %21)
  %27 = add nuw nsw i64 %10, 1
  %28 = icmp eq i64 %27, 800
  br i1 %28, label %6, label %9, !llvm.loop !39

29:                                               ; preds = %6
  tail call void @_Z8simFlushv()
  %30 = load i32*, i32** @_ZL8prev_gen, align 8, !tbaa !9
  %31 = load i32*, i32** @_ZL8next_gen, align 8, !tbaa !9
  store i32* %31, i32** @_ZL8prev_gen, align 8, !tbaa !9
  store i32* %30, i32** @_ZL8next_gen, align 8, !tbaa !9
  br label %1, !llvm.loop !40
}

declare void @_Z8simFlushv() local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress noreturn uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
!9 = !{!10, !10, i64 0}
!10 = !{!"any pointer", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5}
!14 = !{i64 0, i64 4, !5}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12}
!19 = !{!20, !6, i64 4}
!20 = !{!"_ZTS9direction", !6, i64 0, !6, i64 4, !6, i64 8, !6, i64 12, !6, i64 16, !6, i64 20, !6, i64 24, !6, i64 28, !6, i64 32}
!21 = !{!20, !6, i64 8}
!22 = !{!20, !6, i64 12}
!23 = !{!20, !6, i64 16}
!24 = !{!20, !6, i64 20}
!25 = !{!20, !6, i64 24}
!26 = !{!20, !6, i64 28}
!27 = !{!20, !6, i64 32}
!28 = distinct !{!28, !12}
!29 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5, i64 12, i64 4, !5, i64 16, i64 4, !5, i64 20, i64 4, !5, i64 24, i64 4, !5, i64 28, i64 4, !5, i64 32, i64 4, !5}
!30 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5, i64 12, i64 4, !5, i64 16, i64 4, !5, i64 20, i64 4, !5, i64 24, i64 4, !5, i64 28, i64 4, !5}
!31 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5, i64 12, i64 4, !5, i64 16, i64 4, !5, i64 20, i64 4, !5, i64 24, i64 4, !5}
!32 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5, i64 12, i64 4, !5, i64 16, i64 4, !5, i64 20, i64 4, !5}
!33 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5, i64 12, i64 4, !5, i64 16, i64 4, !5}
!34 = !{i64 0, i64 4, !5, i64 4, i64 4, !5, i64 8, i64 4, !5, i64 12, i64 4, !5}
!35 = !{i64 0, i64 4, !5, i64 4, i64 4, !5}
!36 = !{i32 0, i32 9}
!37 = distinct !{!37, !12}
!38 = distinct !{!38, !12}
!39 = distinct !{!39, !12}
!40 = distinct !{!40, !12}
