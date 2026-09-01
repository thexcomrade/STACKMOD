# Modules & Packages

# Q1. Create a module mathutils.py with functions add(), sub(), mul(), div(). Import it into another script and use each function.
# Q2. Import only add and mul from mathutils using from ... import ....
# Q3. Import mathutils with an alias mu and call mu.add(3, 4).

import mathutils as mu
# add_result = mathutils.add(5, 3)
# sub_result = mathutils.sub(5, 3)
# mul_result = mathutils.mul(5, 3)
# div_result = mathutils.div(5, 3)

print(mu.add(5, 3))
print(mu.sub(5, 3))
print(mu.mul(5, 3))
print(mu.div(5, 3))

# Q4. Create a package folder structure:
# calc_pkg/
# __init__.py
# basic.py
# advanced.py
# basic.py should have add, sub; advanced.py should have power, sqrt. Import and use both modules from a script outside the package.

import calc_pkg.basic as pk
import calc_pkg.advanced as pa
print(pk.add(10, 5))
print(pk.sub(10, 5))
print(pa.power(2, 3))
print(pa.sqrt(16))

# Q5. Use the built-in math module to calculate factorial, square root, and ceiling of a number.

import math as ma
print(ma.factorial(5))
print(ma.sqrt(16))
print(ma.ceil(3.2))

# Q6. Use the random module to generate 5 random integers between 1 and 100

import random as rd
for _ in range(5):
    print(rd.randint(1, 100))