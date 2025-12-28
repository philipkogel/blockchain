// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract WillThrow {
    //custom errors
    error NotAllowedError(string);
    function example() public pure {
        // require(false, "Error message");
        revert NotAllowedError("Not allowed."); // this will be logged by ErrorLowLevelData
    }
}

contract ErrorHandling {
    event ErrorLogging(string err);
    event ErrorLogCode(uint code);
    event ErrorLowLevelData(bytes data);
    function catchError() public {
        WillThrow will = new WillThrow();
        try will.example() {
            // add code here if works
        } catch Error(string memory err) {
            // for require
            emit ErrorLogging(err);
        } catch Panic(uint errCode) {
            // for asserts
            emit ErrorLogCode(errCode);
        } catch(bytes memory lowLevelData) {
            emit ErrorLowLevelData(lowLevelData);
        }
    }
}