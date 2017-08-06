pragma solidity ^0.4.11;

contract AddN {
  int public n;

  function AddN(int _n) {
    n = _n;
  }

  function apply(int _x) constant returns (int) {
    return _x + n;
  }

  function setN(int _n) {
    n = _n;
  }
}
