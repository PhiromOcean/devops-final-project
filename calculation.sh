#!/bin/bash

# Addition function
addition() {
    echo "Result: $(($1 + $2))"
}

# Subtraction function
subtraction() {
    echo "Result: $(($1 - $2))"
}

# Multiplication function
multiplication() {
    echo "Result: $(($1 * $2))"
}

# Modulus function
modulus() {
    if [ "$2" -eq 0 ]; then
        echo "Error: Cannot divide by zero!"
    else
        echo "Result: $(($1 % $2))"
    fi
}

# Main program
read -p "Enter first number: " num1
read -p "Enter operator (+, -, *, %): " operator
read -p "Enter second number: " num2

if [ "$operator" = "+" ]; then
    addition "$num1" "$num2"

elif [ "$operator" = "-" ]; then
    subtraction "$num1" "$num2"

elif [ "$operator" = "*" ]; then
    multiplication "$num1" "$num2"

elif [ "$operator" = "%" ]; then
    modulus "$num1" "$num2"

else
    echo "Invalid operator!"
fi