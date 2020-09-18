==== Source: s1.sol ====
function f() pure returns (uint) { return 1337; }
contract C {
  function g() public pure virtual returns (uint) {
    return f();
  }
}
==== Source: s2.sol ====
import "s1.sol";
function f() pure returns (uint) { return 1; }
contract D is C {
  function g() public pure override returns (uint) {
    return f();
  }
}
// ====
// compileViaYul: also
// ----
// g() -> 1
