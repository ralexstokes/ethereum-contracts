pragma solidity ^0.4.11;

contract AddNMalicious {
  int public n;

  function AddNMalicious(int _n) {
    n = _n;
  }

  function apply(int _x) constant returns (int) {
    // change our incrementer, even though function is constant
    n = _x;
    return _x + n;
  }

  function setN(int _n) {
    n = _n;
  }
}
