include altlib."test_allocator.al"

func .merge_sort(a #1I, lx #I, rx #I,
                 allocator #1TestAllocator) -> #V {
    eval if (rx - lx > 1) {
        def m := (lx + rx) / 2
        eval merge_sort(a, lx, m, allocator)
        eval merge_sort(a, m, rx, allocator)
        
        def b := allocator.alloc((rx - lx) * $#I)
        def ptr1 := lx
        def ptr2 := m
        def ptr3 := 0
        eval while (ptr3 < rx - lx) {
            eval if (ptr1 < m and 
                    (ptr2 = rx or a[ptr1] < a[ptr2])) {
                b[ptr3]& <- a[ptr1]
                ptr1 := ptr1 + 1
            }
            else {
                b[ptr3]& <- a[ptr2]
                ptr2 := ptr2 + 1
            }
            ptr3 := ptr3 + 1
        }
        ptr3 := 0
        eval while (ptr3 < rx - lx) {
            a[lx + ptr3]& <- b[ptr3]
            ptr3 := ptr3 + 1
        }
    }
}
