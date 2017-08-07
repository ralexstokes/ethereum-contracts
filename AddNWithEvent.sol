pragma solidity ^0.4.11;

contract AddNWithEvent {
  int public n;

  event Addition(int input, int increment, int output);

  function AddNWithEvent(int _n) {
    n = _n;
  }

  function apply(int _x) constant returns (int) {
    int result = _x + n;
    Addition(_x, n, result);
    return result;
  }
}
