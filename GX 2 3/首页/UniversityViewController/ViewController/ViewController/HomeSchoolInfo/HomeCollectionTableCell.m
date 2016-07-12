//
//  HomeCollectionTableCell.m
//  首页
//
//  Created by puyantao on 16/6/17.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "HomeCollectionTableCell.h"
#import "HomeIntroductionCell.h"
#import "HomeProdessionalCell.h"
#import "HomeCommentCell.h"
#import "HomeIntroductionModel.h"
#import "HomeDepartmentViewController.h"
#import "HomeCommentUserInfoViewController.h"
#import "UniversityChildrenModel.h"

@interface HomeCollectionTableCell ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
{
    UITableView *introductionTableView;
    UITableView *professionalTableView;
    UITableView *commentTableView;
    
}


@end


@implementation HomeCollectionTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutUI];
        
    }
    return self;
    
}

- (void)layoutUI{
    self.backgroundColor = [UIColor blueColor];
    _blockScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-229)];
    _blockScrollView.contentSize = CGSizeMake(kScreenWidth*3, kScreenHeight-64-229);
    _blockScrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _blockScrollView.pagingEnabled = YES;
    _blockScrollView.bounces = NO;
    _blockScrollView.delegate = self;
    _blockScrollView.showsHorizontalScrollIndicator = NO;
    _blockScrollView.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:_blockScrollView];
    
    for (int index = 0; index<3; index++) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(kScreenWidth*index, 0, kScreenWidth, _blockScrollView.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [_blockScrollView addSubview:tableView];
        
        if (index == 0) {
            introductionTableView = tableView;
            [introductionTableView registerClass:[HomeIntroductionCell class] forCellReuseIdentifier:@"introductionCell"];
            
        }else if(index == 1){
            professionalTableView = tableView;
            [professionalTableView registerClass:[HomeProdessionalCell class] forCellReuseIdentifier:@"professionalCell"];
            
        }else{
            commentTableView = tableView;
            [commentTableView registerClass:[HomeCommentCell class] forCellReuseIdentifier:@"commentCell"];
            
        }
        

    }
    
}

#pragma mark ************************ tableViewDelegate methods *******************************
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == introductionTableView) {
        return self.infoModel.introduction.count;
        
    }else if (tableView == professionalTableView){
        return self.infoModel.prodessional.count;
        
    }else{
        return self.infoModel.comment.count;
        
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == introductionTableView) {
        HomeIntroductionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"introductionCell" forIndexPath:indexPath];
        cell.model = self.infoModel.introduction[indexPath.row];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
        
    }else if (tableView == professionalTableView){
        HomeProdessionalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"professionalCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.model = self.infoModel.prodessional[indexPath.row];
        return cell;
        
    }else{
        HomeCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.model = self.infoModel.comment[indexPath.row];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == introductionTableView) {
        HomeIntroductionModel *model = self.infoModel.introduction[indexPath.row];
        return model.cellHeight;
        
    }else if (tableView == professionalTableView){
        return 44;
        
    }else{
        return 135;
        
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == professionalTableView) {
        HomeDepartmentViewController *departmentVC = [[HomeDepartmentViewController alloc]init];
        departmentVC.model = self.infoModel.prodessional[indexPath.row];
        departmentVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self.originalVC presentViewController:departmentVC animated:YES completion:nil];
        
    }else if (tableView == commentTableView){
        HomeCommentUserInfoViewController *infoVC = [[HomeCommentUserInfoViewController alloc]init];
        infoVC.model = self.infoModel.comment[indexPath.row];
        infoVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self.originalVC presentViewController:infoVC animated:YES completion:nil];
        
    }
    
}



#pragma mark ************************ scrollViewDelegate methods *******************************
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == self.blockScrollView) {
        int index = scrollView.contentOffset.x/kScreenWidth;
        [self.headerView cellScrollViewIndex:index];
        
        
    }

}



@end

















