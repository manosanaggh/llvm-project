@.str = private unnamed_addr constant [3 x i8] c"%f\00", align 1

define i32 @foo() {
  %a = add i32 2, 3
    %1 = call i32 @printf(i8*getelementptr inbounds ([3 x i8],[3 x i8]* @.str, i32 0, i32 0))
  ret i32 %a
}

declare i32 @printf(i8*nocapture)

define void @bar() {
  ret void
}

