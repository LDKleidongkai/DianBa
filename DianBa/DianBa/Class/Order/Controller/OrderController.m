
//
//  OrderController.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/28.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "OrderController.h"

@interface OrderController ()<UITableViewDelegate,UITableViewDataSource,GoodsListCellDelegate,ShoppingCarDelegate>

@end

@implementation OrderController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    _orderView.ordertable.tableHeaderView.height = OrderHeaderHeight;
    _orderView.hotPotTable.tableHeaderView.height = 55;
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加tableView
    [self.view addSubview:self.orderView];
    // 加载数据
    [self loadData];
    [self.orderView.returnBtn addTarget:self action:@selector(returnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.orderView.nReturnBtn addTarget:self action:@selector(returnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView.maskBtn addTarget:self action:@selector(pushToShopDetails:) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addGoodNum) name:@"add" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cutGoodNum) name:@"cut" object:nil];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
#pragma mark - 角标变化的方法
//通知角标-1
-(void)cutGoodNum
{
    [hub decrement];
}
//角标+1
-(void)addGoodNum
{
    [hub increment];
    [hub pop];
}
#pragma mark - 跳转方法
- (void)returnBtnClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)pushToShopDetails:(UIButton *)sender{
    [self.navigationController pushViewController:[[ShopDetailsController alloc] init] animated:YES];
}
- (void)pushToPalceOrderConreoller:(UIButton *)btn{
    [self.navigationController pushViewController:[[PlaceOederController alloc] init] animated:YES];
}
#pragma mark - 请求数据
- (void)loadData{
    [OrderData storeFoodWithStoreId:@"1" success:^(OrderResult *storeFoods) {
        self.result = storeFoods;
        NSArray *array = storeFoods.menu_info;
        [self.storesArr addObjectsFromArray:array];
        // 头视图内容
        NSString *store_photo = self.result.store_photo;
        [self.headerView.shopImg sd_setImageWithURL:[NSURL URLWithString:store_photo]];
        self.headerView.shopName.text = self.result.store_name;
        self.headerView.shopBrief.text = self.result.store_con;
        self.headerView.backgroundImgView.image = [[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:store_photo]]] blurImageWithRadius:25];
        
        // 菜品类型
        NSMutableArray *allKeyArr = [NSMutableArray array];
        for (OrderMenu *menu in self.storesArr) {
            [allKeyArr addObject:menu];
        }
        [self.dataDic setValue:allKeyArr forKey:@"全部"];
        NSMutableArray *keyarr = [NSMutableArray array];
        for (OrderMenu *menu in self.storesArr) {
            [keyarr addObject:menu.foot_type];
        }
        NSMutableArray *mar = [NSMutableArray array];
        for (int i = 0; i < keyarr.count; i ++) {
            if ([mar containsObject:keyarr[i]] == NO) {
                [mar addObject:keyarr[i]];
            }
        }
        for (NSString *type in mar) {
            NSMutableArray *arr = [NSMutableArray array];
            for (OrderMenu *menu in array) {
                if ([menu.foot_type containsString:type]) {
                    [arr addObject:menu];
                }
            }
            [self.dataDic setValue:arr forKey:type];
        }
        self.orderArray = [self.dataDic objectForKey:@"全部"];
        [self.orderView.ordertable reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}
#pragma mark - 购物车
// 购物车动画
- (void)shoppingCarAnimationWithCell:(GoodsListCell *)cell tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath{
    cell.clickCars = ^(UIImageView *imageView){
        CGRect rect = [tableView rectForRowAtIndexPath:indexPath];
        //获取当前cell 相对于self.view 当前的坐标
        rect.origin.y = rect.origin.y - [tableView contentOffset].y;
        CGRect imageViewRect = imageView.frame;
        imageViewRect.origin.y = rect.origin.y+imageViewRect.origin.y;
        [[PurchaseCarAnimationTool shareTool]startAnimationandView:imageView andRect:imageViewRect andFinisnRect:CGPointMake(62, ScreenHeight-49) andFinishBlock:^(BOOL finisn){
            
            UIView *tabbarBtn = self.orderView.carBtn;
            [PurchaseCarAnimationTool shakeAnimation:tabbarBtn];
        }];
    };
}
// 显示购物车颜色
- (void)shoppingCarHidden{
    self.orderView.rMBLabel.textColor = [GVColor hexStringToColor:@"#b3b3b3"];
    self.orderView.priceLabel.textColor = [GVColor hexStringToColor:@"#b3b3b3"];
    self.orderView.balanceBtn.backgroundColor = [GVColor hexStringToColor:@"#7f7f7f"];
    [self.orderView.balanceBtn setTitleColor:[GVColor hexStringToColor:@"#e6e6e6"] forState:UIControlStateNormal];
}
// 隐藏购物车颜色
- (void)shoppingCarNotHidden{
    self.orderView.rMBLabel.textColor = [UIColor whiteColor];
    self.orderView.priceLabel.textColor = [UIColor whiteColor];
    self.orderView.balanceBtn.backgroundColor = [UIColor colorWithRed:253/250.0 green:173/250.0 blue:19/250.0 alpha:1.0];
    [self.orderView.balanceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

#pragma mark - tableView DataSource||Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView.tag == 2 ||tableView.tag == 3000) {
        return 1;
    }
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array =[self.dataDic allKeys];
    if (tableView.tag == 2) {
        return array.count;
    }
    if (tableView.tag == 3000) {
        return self.shopArr.count;
    }
    return self.orderArray.count;
}
#pragma mark warning 点击时的文字颜色
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array =[self.dataDic allKeys];
    if (tableView.tag == 2) {
        
        static NSString *typeID = @"typeID";
        TypeListCell *typeCell = [tableView dequeueReusableCellWithIdentifier:typeID];
        if (typeCell == nil) {
            typeCell = [[NSBundle mainBundle] loadNibNamed:@"TypeListCell" owner:self options:nil].lastObject;
        }
        typeCell.kindListLabel.text = array[indexPath.row];
        typeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return typeCell;
    }
    if (tableView.tag == 3000) {
//        shopCell =[tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"shopcell%ld",indexPath.row]];
        static NSString *ID = @"cell";
        shopCell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!shopCell) {
//            shopCell =[[ShoppingCarListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"shopcell%ld",indexPath.row]];
            shopCell = [[NSBundle mainBundle] loadNibNamed:@"ShoppingCarListCell" owner:self options:nil].lastObject;
        }
        shopCell.delegate = self;
        shopCell.model = self.shopArr[indexPath.row];
        return shopCell;
    }
    
    GoodsListCell *goodsCell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%ld%ld",indexPath.section,indexPath.row]];
    if (goodsCell == nil) {
        goodsCell = [[NSBundle mainBundle] loadNibNamed:@"GoodsListCell" owner:self options:nil].lastObject;
    }
    goodsCell.selectionStyle=UITableViewCellSelectionStyleNone;
    goodsCell.delegate = self;
    goodsCell.model = self.orderArray[indexPath.row];
    // 购物车效果
    [self shoppingCarAnimationWithCell:goodsCell tableView:tableView indexPath:indexPath];
    return goodsCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 2) {
        return 45;
    }else if (tableView.tag == 3000){
        return 50;
    }
    return 85;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 2) {
        NSArray *allkeys = [self.dataDic allKeys];
        self.orderArray = [self.dataDic objectForKey:allkeys[indexPath.row]];
        [self.orderView.ordertable reloadData];
    }
    else if (tableView.tag == 3000){
        
    }
    else{
        [self.navigationController pushViewController:[[DetailsTableViewController alloc] init] animated:YES];
    }
}

#pragma mark - GoodsListCellDelegate
//增加商品数量的方法
-(void)goodlistNumDelegate:(GoodsListCell *)cell WithBtn:(UIButton *)btn
{
    NSIndexPath *indexPath =[self.orderView.ordertable indexPathForCell:cell];
    OrderMenu *model = self.orderArray[indexPath.row];

    if (btn.tag == 1001) {
        model.number = [NSString stringWithFormat:@"%d",model.number.intValue - 1];
        [self cutPriceWithPrice:model.menu_price];
        [self.dataArray addObject:model];
        for (int i = 0; i < self.dataArray.count; i ++) {
            if ([self.shopArr containsObject:self.dataArray[i]] == NO) {
                [self.shopArr addObject:self.dataArray[i]];
            }
        }
    }else{
        model.number = [NSString stringWithFormat:@"%d",model.number.intValue + 1];
        [self addPriceWithPrice:model.menu_price];
        [self.dataArray addObject:model];
        for (int i = 0; i < self.dataArray.count; i ++) {
            if ([self.shopArr containsObject:self.dataArray[i]] == NO) {
                [self.shopArr addObject:self.dataArray[i]];
            }
        }
    }
    for (int i = 0; i<self.dataArray.count; i++) {
        OrderMenu *goodModel =self.dataArray[i];
        if ([goodModel.menu_name isEqualToString:model.menu_name]) {
            goodModel.number = model.number;
        }
        if (model.number.intValue == 0) {
            [self.dataArray removeObject:goodModel];
        }
    }
    [self updatePrice];
    [self updateTableView];
}
//购物车商品数量发生变化的时候需要执行的代理方法
-(void)shopCartListCell:(ShoppingCarListCell *)Cell WithBtn:(UIButton *)btn
{
    NSIndexPath *indexPath =[_shopCartTableView indexPathForCell:Cell];
    OrderMenu *model = self.shopArr[indexPath.row];
    NSArray *array = [self.dataDic objectForKey:model.menu_type];
    if (btn.tag == 2222) {
        model.number =[NSString stringWithFormat:@"%d",model.number.intValue +1];
        [self addPriceWithPrice:model.menu_price];
    }else{
        model.number =[NSString stringWithFormat:@"%d",model.number.intValue -1];
        [self cutPriceWithPrice:model.menu_price];
        
    }
    [self updatePrice];
    for (int i = 0; i<array.count; i++) {
        OrderMenu *gooModel =array[i];
        if ([gooModel.menu_name isEqualToString:model.menu_name]) {
            gooModel.number = model.number;
            if (model.number.intValue <=0) {
                [self.dataArray removeObject:model];
                gooModel.number = @"0";
            }
            continue;
        }
        
    }
    [self updateTableView];
    
}
//更新视图方法
-(void)updateTableView
{
    _shopCartTableView.frame=CGRectMake(0,  ScreenHeight-(61+49)-self.dataArray.count*50, ScreenWidth, (61+49) + self.dataArray.count*50+10);
    [_shopCartTableView reloadData];
    [self.orderView.ordertable reloadData];
}
//增加总价的时候
-(void)addPriceWithPrice:(NSString *)addprice
{
    NSString *price =[self.orderView.priceLabel.text substringWithRange:NSMakeRange(1, self.orderView.priceLabel.text.length-1)];
    self.orderView.priceLabel.text =[NSString stringWithFormat:@"%.2f",price.floatValue + addprice.floatValue];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"add" object:nil];
}
//减少总价的时候
-(void)cutPriceWithPrice:(NSString *)cutprice
{
    NSString *price =[self.orderView.priceLabel.text substringWithRange:NSMakeRange(1, self.orderView.priceLabel.text.length-1)];
    self.orderView.priceLabel.text =[NSString stringWithFormat:@"%.2f",price.floatValue - cutprice.floatValue];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"cut" object:nil];
}
//判断购物车是否为空
-(void)updatePrice
{
    NSString *newPrice =[self.orderView.priceLabel.text substringWithRange:NSMakeRange(1, self.orderView.priceLabel.text.length-1)];
    if (newPrice.floatValue <= 0.00) {
        self.orderView.priceLabel.text =@"0.0";
        [self shoppingCarHidden];
    }else{
        [self shoppingCarNotHidden];
    }
}
//点击购物车图标执行的方法
-(void)shopcartClickBtn:(UIButton *)btn
{
    [self.orderView.carBackgroundView removeFromSuperview];
    [self addTableViewShopCartlist];
}
//增加购物车列表
-(void)addTableViewShopCartlist
{
    // 点击购物车时的蒙版
    _views =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    _views.backgroundColor =[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.1];
    [self.view addSubview:_views];
    // 结算时的tableView
    _shopCartTableView =[[UITableView alloc]initWithFrame:CGRectMake(0,  ScreenHeight - (61+49) -self.shopArr.count*50, ScreenWidth, (61+49) + self.shopArr.count*50)];
    _shopCartTableView.dataSource = self;
    _shopCartTableView.delegate = self;
    _shopCartTableView.tag= 3000;
    _shopCartTableView.tableHeaderView = self.carHeader;
    _shopCartTableView.tableFooterView = self.carFooter;
    [_views addSubview:_shopCartTableView];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_views removeFromSuperview];
    [self.orderView addSubview:self.orderView.carBackgroundView];
}

#pragma mark - 侧滑按钮方法
- (void)rowingBtnClcik:(UIButton *)sender{
    _isHiddenHot = !_isHiddenHot;
    if (_isHiddenHot == YES) {
        [self showMenu];
    }else{
        [self hiddenMenu];
    }
    [_orderView.ordertable reloadData];
}
// 点击手势
- (void)tapGesture:(UITapGestureRecognizer *)tap{
    _isHiddenHot = !_isHiddenHot;
    [self showMenu];
    [self.orderView.ordertable reloadData];
}
// 显示菜单列表
- (void)showMenu{
    _orderView.ordertable.tableHeaderView.hidden = NO;
    _orderView.ordertable.tableHeaderView.height = OrderHeaderHeight;
    self.orderView.navigationView.hidden = YES;
    _orderView.ordertable.frame = CGRectMake(StartX, -20, ScreenWidth, ScreenHeight + 20);
    _orderView.ordertable.scrollEnabled = YES;
    // 移除火锅配菜tableView
    [_orderView.hotPotTable removeFromSuperview];
    _orderView.rowingBtn.frame = CGRectMake(StartX, 378, 26, 80);
    [self.maskView removeFromSuperview];
}
// 隐藏菜单
- (void)hiddenMenu{
    _orderView.ordertable.tableHeaderView.hidden = YES;
    _orderView.ordertable.tableHeaderView.height = 0;
    [self setUpNavigationBar];
    _orderView.ordertable.frame = CGRectMake(235, StartY, ScreenWidth, ScreenHeight);
    _orderView.ordertable.scrollEnabled = NO;
    // 添加火锅配菜tableView
    [_orderView addSubview:_orderView.hotPotTable];
    _orderView.rowingBtn.frame = CGRectMake(235, 378, 26, 80);
    [_orderView.ordertable addSubview:self.maskView];
}

#pragma mark - 导航条的显示及隐藏
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag == 1) {
        CGFloat offsetY = scrollView.contentOffset.y;
        if (offsetY > 40) {
            [UIView animateWithDuration:0.5 animations:^{
                [self setUpNavigationBar];
            }];
        }else{
            [UIView animateWithDuration:0.5 animations:^{
                self.orderView.navigationView.hidden = YES;
            }];
            [self.view addSubview:_orderView.returnBtn];
            [self.view addSubview:_orderView.collectionBtn];
        }
    }
    else if (scrollView.tag == 2){
        [self setUpNavigationBar];
    }
}
// 添加导航条
- (void)setUpNavigationBar{
    self.orderView.navigationView.hidden = NO;
    self.orderView.titleLabel.text = self.headerView.shopName.text;
}
#pragma mark - 懒加载
-(MaskView *)maskView{
    if (_maskView == nil) {
        _maskView = [[MaskView alloc] initWithFrame:CGRectMake(StartX, StartY, ScreenWidth - 235, ScreenHeight)];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [_maskView addGestureRecognizer:tap];
        self.tap = tap;
    }
    return _maskView;
}
- (NSArray *)typeArr{
    if (_typeArr == nil) {
        self.typeArr = @[@"全部",@"甜品",@"烧烤",@"主食",@"酒水"];
    }
    return _typeArr;
}
-(OrderTableView *)orderView{
    if (_orderView == nil) {
        _orderView = [[OrderTableView alloc] initWithFrame:self.view.bounds];
        // 点餐
        _orderView.ordertable.delegate = self;
        _orderView.ordertable.dataSource = self;
        _orderView.ordertable.tableHeaderView = self.headerView;
        // 火锅
        _orderView.hotPotTable.delegate = self;
        _orderView.hotPotTable.dataSource = self;
        _orderView.hotPotTable.tableHeaderView = self.hotHeaderV;
        // 固定按钮
        _isHiddenHot = YES;
        [_orderView.rowingBtn addTarget:self action:@selector(rowingBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
        // 提示角标
        hub = [[RKNotificationHub alloc]initWithView:_orderView.carBtn];
        [hub moveCircleByX:-5 Y:5];
        // 计算按钮
        [_orderView.carBtn addTarget:self action:@selector(shopcartClickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_orderView.balanceBtn addTarget:self action:@selector(pushToPalceOrderConreoller:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _orderView;
}
-(OrderHeaderView *)headerView{
    if (_headerView == nil) {
        self.headerView = [[NSBundle mainBundle] loadNibNamed:@"OrderHeaderView" owner:self options:nil].lastObject;
        self.headerView.frame = CGRectMake(StartX, StartY, 100, 100);
    }
    return _headerView;
}
-(MenuHeaderView *)hotHeaderV{
    if (_hotHeaderV == nil) {
        _hotHeaderV = [[NSBundle mainBundle] loadNibNamed:@"MenuHeaderView" owner:self options:nil].lastObject;
        _hotHeaderV.frame = CGRectMake(StartX, StartY, 235, 55);
    }
    return _hotHeaderV;
}
- (NSMutableArray *)storesArr{
    if (_storesArr == nil) {
        self.storesArr = [[NSMutableArray alloc] init];
    }
    return _storesArr;
}
- (OrderResult *)result{
    if (_result == nil) {
        _result = [[OrderResult alloc] init];
    }
    return _result;
}
- (NSMutableDictionary *)dataDic{
    if (_dataDic == nil) {
        _dataDic = [[NSMutableDictionary alloc] init];
    }
    return _dataDic;
}
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (NSArray *)orderArray{
    if (_orderArray == nil) {
        _orderArray = [NSMutableArray array];
    }
    return _orderArray;
}
- (NSMutableArray *)shopArr{
    if (_shopArr == nil) {
        _shopArr = [NSMutableArray array];
    }
    return _shopArr;
}
- (ShoppingCarHeader *)carHeader{
    if (_carHeader == nil) {
        _carHeader = [[NSBundle mainBundle] loadNibNamed:@"ShoppingCarHeader" owner:self options:nil].lastObject;
        _carHeader.frame = CGRectMake(0, 0, ScreenWidth, 61);
    }
    return _carHeader;
}
- (ShoppingCarFooterView *)carFooter{
    if (_carFooter == nil) {
        _carFooter = [[NSBundle mainBundle] loadNibNamed:@"ShoppingCarFooterView" owner:self options:nil].lastObject;
        _carFooter.frame = CGRectMake(0, 0, ScreenWidth, 49);
    }
    return _carFooter;
}
@end
