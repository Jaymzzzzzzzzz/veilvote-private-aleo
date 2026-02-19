// The 'test_veilvote_private_j007' test program.
import veilvote_private_j007.aleo;
program test_veilvote_private_j007.aleo {
    @test
    script test_it() {
        let result: u32 = veilvote_private_j007.aleo/main(1u32, 2u32);
        assert_eq(result, 3u32);
    }

    @test
    @should_fail
    transition do_nothing() {
        let result: u32 = veilvote_private_j007.aleo/main(2u32, 3u32);
        assert_eq(result, 3u32);
    }

    @noupgrade
    async constructor() {}
}
