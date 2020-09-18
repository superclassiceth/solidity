==== Source: s1.sol ====
function f() pure returns (uint) { return 1337; }
contract C {
  function g() public pure returns (uint) {
    return f();
  }
}
==== Source: s2.sol ====
import "s1.sol";
function f() pure returns (uint) { return 1; }
contract D is C {
  function h() public pure returns (uint) {
    return g();
  }
}
// ====
// compileViaYul: also
// ----
// h() -> 1337
