include altlib."posix.al"
include altlib."stdio.al"
include altlib."test_allocator.al"
include ."merge_sort.al"

func ^._start() -> #V {
    def allocator #TestAllocator
    eval allocator&.init(1024 * 1024)
    defer eval allocator&.deinit()

    def n := readi_()
    def a := allocator&.alloc(n * $#I) as #1I
    def i := 0
    eval while (i < n) {
        a[i]& <- readi_()
        i := i + 1
    }

    eval merge_sort(a, 0, n, allocator&)

    i := 0
    eval while (i < n) {
        eval puti_(a[i])
        i := i + 1
    }

    eval posix_exit(0)
}
