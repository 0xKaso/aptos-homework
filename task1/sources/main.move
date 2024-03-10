module 0x42::Lesson2{
    struct Wallet has drop {
        balance: u64
    }

    fun myWallet() : Wallet {
        Wallet { balance: 1000 }
    }

    #[test]
    fun test_wallet() {
        let wallet = myWallet();
        assert!(wallet.balance == 1000, 0);
    }
}