In Objective-C, a common yet subtle issue arises when dealing with memory management and object lifecycles, especially when using blocks.  Consider this scenario:

```objectivec
@property (nonatomic, strong) NSMutableArray *dataArray;

- (void)someMethod {
    [self.dataArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        // ... some operation on 'obj' ...
        if (someCondition) {
            [self.dataArray removeObject:obj]; // Potential issue here
        }
    }];
}
```

The problem lies in modifying the `dataArray` while iterating over it using a block. Removing an object during enumeration can lead to unexpected behavior, crashes, or data corruption because the indices shift, causing the enumeration to skip elements or access invalid memory locations. 