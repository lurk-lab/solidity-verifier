// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "@std/Test.sol";
import "src/verifier/step4/spark/SparkMultiEvaluation.sol";

contract SparkMultiEvaluationTest is Test {
    function testSparkMultiEvaluationSecondary() public {
        uint256[] memory r_x = new uint256[](14);
        r_x[0] = 0x0f165407419e8c2e7685d7d70bf99a758d8d7fbea89da907b3aeaa7bee833a56;
        r_x[1] = 0x29560c2a6cfae551d9c4dca9c51099996b3d3c2bdd2498e787f046506ba52814;
        r_x[2] = 0x362da2eabc9f9e7d98621f197a1302f443ce859376ef1855b994adeed58fe545;
        r_x[3] = 0x3cca5c7ea86a6a28fe166886c9170d6c5c11c0c3a62ec3542461ab9d4570db8e;
        r_x[4] = 0x011032bc2a262b1177be0d1a0819af301f07b2526b482a642c044e9f1fb235e0;
        r_x[5] = 0x2457b45828d84cbec89fe251bf00eef3eef83c892343349798c252ddfa6ed892;
        r_x[6] = 0x1e75806536a945babea5f7c8f9919c044ecac67b97598cb833253aebea65f43a;
        r_x[7] = 0x26ffb40cd04ebeee0ef0534d2e0ab8f3bab0b7965896acc89e8ca6d73fb7998f;
        r_x[8] = 0x0204eda144c122b0dd23f2730444b643873d2dfd24b3d9f6e4120699f8d67f17;
        r_x[9] = 0x2a5748db09c9d1253f8accba25f25e6cf536baadf655939b25f762251b238433;
        r_x[10] = 0x006775e2804bb5851a122fb8d1023ff427e3614f93b9dc201811638c88ce449b;
        r_x[11] = 0x1ff82c34a25a9521840fe3fce05a08766cf8236f214871de953ffed41f5312ba;
        r_x[12] = 0x070bb7c8b02abf2d75ef8b6b8fb3997745d1c041991e0d3af11d78b11f879920;
        r_x[13] = 0x0218ba00634e903a39bd7ed1388141981ac7aaa0572ba61802aaf2b580667bf1;

        uint256[] memory r_y = new uint256[](15);
        r_y[0] = 0x133d7ae3ae852269542c5198e6d1054dfc720f32dc111075699e40f4bed9dc98;
        r_y[1] = 0x3916fe320f183c1453d0e9bb3bfa7374793096fdf38379aedea66cc7dcaf7e08;
        r_y[2] = 0x2a0d9fc4ae15bdce6a8e5a5471fb590535e9533508f035d90f9255fb48fc2e76;
        r_y[3] = 0x01b240c33764723dece2cb1b9df078fa37358487b31b02566ff41185864a5e62;
        r_y[4] = 0x17848bd9c88037915d94e8fce040d9ed50cfb2894c2fe9423f6dbe5c34d23cb3;
        r_y[5] = 0x26f476c4734135d0f82908d3e78552efc3d0f283eaa8c09ab62b54ac7d14addc;
        r_y[6] = 0x2a0fafde03242db9d319f8e09fff11a7e2f6124ed17cea107da09f36eb30dbbe;
        r_y[7] = 0x17901b6eba9aa318f4865f1f920197823475f95d8f45869885cd1791dc165716;
        r_y[8] = 0x300f98dcdf44099acb80516ec8ee48316df00cd09ccba21837a0cd906637778e;
        r_y[9] = 0x2a252100fac6781457578c3f24510de75b67164a4c6fd26ea6e8f7b86689dba4;
        r_y[10] = 0x3716a88a6fc03454b3527bb7ca8a0175ec71ec39a40de88f770dfe44ae611b1f;
        r_y[11] = 0x3e464a14ffef67ca9d1bb49e9afa113bcc701884b3aaa68385f4e6f804c07500;
        r_y[12] = 0x34169db7131567c40085024f4177f987cbcbf6168e630db10bd79f8d5775f37b;
        r_y[13] = 0x1ed7da2e753c94332e034b046d37937577582b78c2cffa3ada412ac7d6446745;
        r_y[14] = 0x3e69c1910a9263ddee4a0cec382a858a67e33f74de3d76058fd6248cd8257cc8;

        (uint256 evalsA, uint256 evalsB, uint256 evalsC) = SparkMultiEvaluationLib.multiEvaluateSecondary(r_x, r_y);

        uint256 evalsA_expected = 0x267c7eb46d40984b873837e3eb10319b67245557e8f49efceaed4836f1cc05ee;
        uint256 evalsB_expected = 0x08250c7a9ba4b363fde20f4f77a5d5634401c952e71556af1d17682322153b43;
        uint256 evalsC_expected = 0x0a01229ad7bbad1e74f05f55c482b1e9ecf2a8b81ed95a4cecc9d78c8f925224;

        assertEq(evalsA, evalsA_expected);
        assertEq(evalsB, evalsB_expected);
        assertEq(evalsC, evalsC_expected);
    }

    function testSparkMultiEvaluationPrimary() public {
        uint256[] memory r_x = new uint256[](14);
        r_x[0] = 0x265e1d73ee4ce9a23d98bf74a9807abd1c0bedf6368e8db884c05bd9336549bd;
        r_x[1] = 0x3a009bec1c4dc776ba75c643de9e61b3070a4a6b3865b5751a3d6f517e483a4a;
        r_x[2] = 0x3932891c1f17ba15d07baba47d6599058812a73225d11a554ced25ad00fd78dd;
        r_x[3] = 0x140622b73b006b8470ed724172721f7d25f3efb2208f42c73e0658fbc493579b;
        r_x[4] = 0x2516f6f6ccf854843d9319fad46a0dff2729c608af31c143590c347d0f0805c6;
        r_x[5] = 0x28942f6ecc7b89c49bfaa569687a9b6902ace63343300e808e86d608eca3f9dc;
        r_x[6] = 0x1ae6542e6085a0c42ae6e947813a6f701329263a1a59f823cb544e83dce0b9cf;
        r_x[7] = 0x39979cf05d7d96da05aba4dd24e9f072d52e8efbf4740f1a857680a096193f8b;
        r_x[8] = 0x2d887fae3954bcb89f20051c96f6812eb841ccc29c8b56e2879e445f74cb4331;
        r_x[9] = 0x29fb4b14d5d53616b881719c4986e5aad92f7320fc1e6c89f301b8a81ab72896;
        r_x[10] = 0x2d69fc2f360b3328cb723687589b065ff4250c414c817bd4f6b187583e103270;
        r_x[11] = 0x06dc812740949078bc2487f020274042e7400e44f7a95d26c2cf6de8b7ba5099;
        r_x[12] = 0x39ade5abede093bbb12d81f27c28cbc7149d1b1ad6e43c49424687fb4c29ae31;
        r_x[13] = 0x3d764ae71118a8a3c653b58c534db9fae607dd9c316cdd3675de0d62e0882bf1;

        uint256[] memory r_y = new uint256[](15);
        r_y[0] = 0x08012c1590c5127d3c6b4fe392b59fb476e4a480929e986393183a712bf11df9;
        r_y[1] = 0x08c4915bf1a1341472a82d0d29d9ed43f72c93b7812e34466494145af762fc6c;
        r_y[2] = 0x36d00685cf2a969330dbdf6a4533d7cb248def77ec139ad13ccdab2eb281993a;
        r_y[3] = 0x0204fd7c7c131b857af8d9c1fe84a8b35685d45bbae8b51ac47af2c0c080363f;
        r_y[4] = 0x1625b26a45ce9c1b46081ed7f0658e80bebe85a069357b39833b74e9be67113c;
        r_y[5] = 0x138f29758140496f766af34905ccbfff72cde5c6fb88374ebb0d5bd4f7102d82;
        r_y[6] = 0x0cab6796b99d03113e2f263ebb7ac9e49c0eba24c2537e78c4c332c7bedb695c;
        r_y[7] = 0x2c32a9b732efeb9657c4f8d08310b314c5092bc6d246be6a8c0d828f858af4ac;
        r_y[8] = 0x1de39d206f4df4fe1b745fe51c04b7405f6f4c371ceb6fb3817b1e4f3b70095b;
        r_y[9] = 0x330de47a606ded4033291e9c612abdfb0b2a7d3dd830cb7b9713eebf89705cdb;
        r_y[10] = 0x1d88a34c65d9cc8f8e009d7e5bfe03e0f01af93065873d5ac133fb5efa73b8df;
        r_y[11] = 0x2b2163f1db7afd6856c760a247fa961d8d623f331975ddc32d35a90218728434;
        r_y[12] = 0x0c2e1ba6d2908afa207a54f11f351dfee8c6ca8d55c032c248e92aa5f15ccd99;
        r_y[13] = 0x17634a890278ae48651f7fa7cea00884f17ccd04365ada8c6e4405a39478212e;
        r_y[14] = 0x0d2d8f8c26d30b56b526ddf9b803f597db14b25fe78fe4dba4ce487d9fb4fcb4;

        (uint256 evalsA, uint256 evalsB, uint256 evalsC) = SparkMultiEvaluationLib.multiEvaluatePrimary(r_x, r_y);

        uint256 evalsA_expected = 0x07122b66b54727bf8bebec13052121d753589eb15040a49cb2ee5884810dc0a4;
        uint256 evalsB_expected = 0x339a352816f770e1bb7437e5cdd54bee76ed9ff13d1d7e9246f33e1a9dbc2656;
        uint256 evalsC_expected = 0x1ee416e56d10079af3a1785954078120077c6e428269fa00527b0e6a61d3d320;

        assertEq(evalsA, evalsA_expected);
        assertEq(evalsB, evalsB_expected);
        assertEq(evalsC, evalsC_expected);
    }
}
