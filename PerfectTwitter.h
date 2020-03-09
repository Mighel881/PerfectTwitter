@interface TFNTwitterStatus: NSObject
@property(readonly, nonatomic) bool isPromoted;
@end

@interface TFNDataViewItem: NSObject
@property(retain, nonatomic) id item;
@end

@interface TFNDataViewController
- (TFNDataViewItem*)itemsInternalDataViewItemAtValidIndexPath: (id)v1;
@end

@interface TFNItemsDataViewController: TFNDataViewController
- (id)itemAtIndexPath: (id)arg1;
@end
