# Range in Julia

1. Its of type UnitRange{Any}
2. It's not an actual vector until collect(1:1000)

## Accelerates in the following situations:
1. Loop block
```{Julia}
n = 10^7
for i in 1:n
  ...
end
#No need for creating an actual 10^7-elements vector.
```

2. Slice
```{Julia}
y=@view x[2:4]

```

3.  Grid points along with broadcasting
```{Julia}
x = range(0.0, 1.0; length=10^6)
y = @. sin(x) + cos(x)

# Broadcasting fusion avoids creating intermediate arrays
# for sin(x) and cos(x).
```

