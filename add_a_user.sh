#!/bin/bash


sudo adduser test5 --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo "test5:1" | sudo chpasswd
