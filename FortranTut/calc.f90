module Calculator
    implicit none
    public :: SumIt
    public :: ProdIt
    public :: SubIt
    public :: DivIt
    public :: PowIt
    public :: FactorialIt
    public :: SumUptoIt
    public :: RunCalc

    private :: takeInputInt, takeInputReal

    real, PRIVATE :: a, b
    integer, PRIVATE :: n, opt

contains

    real function SumIt(n1, n2) result (Ans)
        real, intent(in) :: n1, n2
        Ans = n1 + n2
    end function SumIt

    real function ProdIt(n1, n2) result (Ans)
        real, intent(in) :: n1, n2
        Ans = n1 * n2
    end function ProdIt

    real function SubIt(n1, n2) result (Ans)
        real, intent(in) :: n1, n2
        Ans = n1 - n2
    end function SubIt

    real function DivIt(n1, n2) result (Ans)
        real, intent(in) :: n1, n2
        Ans = n1 / n2
    end function DivIt

    real function PowIt(n1, n2) result (Ans)
        real, intent(in) :: n1, n2
        Ans = n1 ** n2
    end function PowIt

    recursive function FactorialIt(n1) result (Ans)
        integer, intent(in) :: n1
        integer :: Ans
        if (n1 <= 1) then
            Ans = 1
        else 
            Ans = n1 * FactorialIt(n1 - 1)
        end if
    end function FactorialIt

    function SumUptoIt(n1) result (Answer)
        integer, intent(in) :: n1
        integer :: Answer, num
        Answer = 0
        do num = 1, n1
            Answer = num + Answer
        end do
    end function SumUptoIt

    subroutine takeInputInt
        implicit none
        write(*, fmt="(a)", advance="no") "Enter the value: "
        read(*, *) n
    end subroutine takeInputInt

    subroutine takeInputReal
        implicit none
        write(*, fmt="(a)", advance="no") "Enter first value: "
        read(*, *) a
        write(*, fmt="(a)", advance="no") "Enter second value: "
        read(*, *) b
    end subroutine takeInputReal

    function RunCalc() result (bool)
        logical :: bool
        write(*, fmt="(a/a/a/a/a/a/a/a/)", advance="no") &
        "~~~~~ Main Menu ~~~~~", &
        "1. Sum", &
        "2. Product", &
        "3. Subtract", &
        "4. Divide", &
        "5. Power", &
        "6. Factorial", &
        "7. Sum upto n"
        bool = .true.
        write(*, fmt="(a)", advance="no") "Choose Your Option: "
        read(*, *) opt
        select case(opt)
        case (1)
            print "(a)", "SUM"
            call takeInputReal()
            print "(f0.3,1x,a1,1x,f0.3,1x,a1,1x,f0.3)", a, "+", b, "=", SumIt(a, b)
        case (2)
            print "(a)", "PRODUCT"
            call takeInputReal()
            print "(f0.3,1x,a1,1x,f0.3,1x,a1,1x,f0.3)", a, "*", b, "=", ProdIt(a, b)
        case (3)
            print "(a)", "SUBTRACT"
            call takeInputReal()
            print "(f0.3,1x,a1,1x,f0.3,1x,a1,1x,f0.3)", a, "-", b, "=", SubIt(a, b)
        case (4)
            print "(a)", "DIVIDE"
            call takeInputReal()
            print "(f0.3,1x,a1,1x,f0.3,1x,a1,1x,f0.3)", a, "/", b, "=", DivIt(a, b)
        case (5)
            print "(a)", "POWER"
            call takeInputReal()
            print "(f0.3,1x,a1,1x,f0.3,1x,a1,1x,f0.3)", a, "^", b, "=", PowIt(a, b)
        case (6)
            print "(a)", "FACTORIAL"
            call takeInputInt()
            print "(i0,a,1x,i0)", n, "! =", FactorialIt(n)
        case (7)
            print "(a)", "SUM TILL N"
            call takeInputInt()
            print "(i0,1x,a,1x,i0)", n, "sum =", SumUptoIt(n)
        case default
            print "(a)", "Wrong Option Choose Again!!"
            bool = .False.
        end select
    end function RunCalc

end module Calculator