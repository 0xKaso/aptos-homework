module 0x42::Demo{
    use std::signer;

    // drop
    struct Foo has drop {
       u: u64,
       b: bool
    }

    fun drop_Fool(u:u64, b:bool):Foo {
        Foo{u ,b}
    }

    #[test]
    fun test(){
        let f = drop_Fool(42, true); // need to drop f
        assert!(f.u == 42,0);
        assert!(f.b == true,1);
    }

    #[test]
    fun test2(){
        let f = drop_Fool(42, true);
        let Foo{u,b} = &mut f;
        *u = 43;
        assert!(f.u == 43,0);
        assert!(f.b == true,1);
    }

    // copy
    struct CanCopy has copy, drop {
        x: u64,
        y: u64
    }

        fun copy_CanCopy(x:u64, y:u64):CanCopy {
        CanCopy{x ,y}
    }

    #[test]
    fun test3(){
        let c = copy_CanCopy(42, 43);
        let c2 = copy c;
        let CanCopy{x,y} = &mut c2;
        *x = 44;
        assert!(c.x == 42,0);
        assert!(c2.x == 44,1);
    }

    // store
    struct Key has key, drop {
        s: Struct
    }

    struct Struct has store, drop {
        x: u64
    }

    fun store_Struct(x:u64):Struct {
        Struct{x}
    }

    #[test]
    fun test4(){
        let s = store_Struct(42);
        let k = Key{s: s};
        assert!(k.s.x == 42,0);
    }

}