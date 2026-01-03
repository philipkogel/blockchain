// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract ExampleUnits {
    modifier betweenOneAndTwoEth() {
        require(msg.value >= 2 ether && msg.value <= 2 ether, "Not between 1 and 2 eth.");
        _;
    }

    // ether
    // gwei
    // wei

    uint runUntillTimestamp;
    uint startTimeStamp;

    constructor(uint startInDays) {
        // valid but with calculations
        // startTimeStamp = block.timestamp + (startInDays * 24 * 60 * 60);
        // runUntillTimestamp = startTimeStamp + (7 * 24 * 60 * 60);

        // valid with units
        startTimeStamp = block.timestamp + (startInDays * 1 days);
        runUntillTimestamp = startTimeStamp + 7 days;
    }

    // seconds
    // minutes
    // hours
    // days
    // weeks
}