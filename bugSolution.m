The solution avoids modifying the array during iteration. Instead, it creates a copy of the array that is then modified:

```objectivec
@property (nonatomic, strong) NSMutableArray *dataArray;

- (void)someMethod {
    NSMutableArray *dataArrayCopy = [self.dataArray mutableCopy];
    [dataArrayCopy enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        // ... some operation on 'obj' ...
        if (someCondition) {
            [dataArrayCopy removeObject:obj];
        }
    }];
    // Now update the self.dataArray with the modified copy
    self.dataArray = dataArrayCopy;
}
```
This approach ensures that the original `dataArray` remains consistent throughout the enumeration, preventing index mismatches and data corruption.