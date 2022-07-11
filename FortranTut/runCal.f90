subroutine CalSim
    use Calculator
    implicit none

    logical :: x = .true., y
    character :: z

    do while(x)
        call system('clear')
        y = RunCalc()
        if (y) then
            write(*, fmt="(a)", advance='no') "do you want to continue [y/n]: "
            read(*, *) z
            if (z == 'y') then
                x = .true.
            else
                x = .false.
            end if
        else 
            print "(a)", "Press Enter to continue"
            read(*, *)
            x = .true.
        end if
    end do
end subroutine CalSim