module 0x42::Task1 {
    struct Wallet has drop {
        balance: u64
    }

    fun myWallet(): Wallet {
        Wallet { balance: 1000 }
    }

    #[test]
    fun test_wallet() {
        let wallet = myWallet();
        assert!(wallet.balance == 1000, 0);
    }
}