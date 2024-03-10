module 0x42::M1{
    friend 0x42::M2;
    
    public fun num():u64 {
        66
    }

    public(friend) fun num2():u64 {
        88
    }
}