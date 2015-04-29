//
//  CorePlotViewController.m
//  Vault_ClientFacingApp
//
//  Created by Harrison Ferrone on 4/29/15.
//  Copyright (c) 2015 Harrison Ferrone. All rights reserved.
//

#import "CorePlotViewController.h"
#import "CorePlot-CocoaTouch.h"
#import "CustomColors.h"

@interface CorePlotViewController () <CPTPlotDataSource>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CorePlotViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeGraph];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)initializeGraph
{
    // We need a hostview, you can create one in IB (and create an outlet) or just do this:
    CPTGraphHostingView* hostView = [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/10, self.view.frame.size.height/15, self.view.frame.size.width/1.25, self.view.frame.size.height/3)];
    [self.view addSubview: hostView];
    
    // Create a CPTGraph object and add to hostView
    CPTGraph* graph = [[CPTXYGraph alloc] initWithFrame:hostView.bounds];
    [graph applyTheme:[CPTTheme themeNamed:kCPTPlainBlackTheme]];
    
    hostView.hostedGraph = graph;
    
    // Create the plot (we do not define actual x/y values yet, these will be supplied by the datasource...)
    CPTScatterPlot* plot = [[CPTScatterPlot alloc] initWithFrame:CGRectZero];
    
    //Line color
    CPTMutableLineStyle *lineStyle = [CPTMutableLineStyle lineStyle];
    lineStyle.lineWidth = 1.0f;
    lineStyle.lineColor = UIColorFromRGB(PINK_HEX);
    plot.dataLineStyle = lineStyle;
    
    // Let's keep it simple and let this class act as datasource (therefore we implemtn <CPTPlotDataSource>)
    plot.dataSource = self;
    
    // Finally, add the created plot to the default plot space of the CPTGraph object we created before
    [graph addPlot:plot toPlotSpace:graph.defaultPlotSpace];
}

#pragma mark - CorePlot Datasource Methods
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plotnumberOfRecords {
    return 9; // Our sample graph contains 9 'points'
}

// This method is here because this class also functions as datasource for our graph
// Therefore this class implements the CPTPlotDataSource protocol
-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
    // We need to provide an X or Y (this method will be called for each) value for every index
    int x = index - 4;
    
    // This method is actually called twice per point in the plot, one for the X and one for the Y value
    if(fieldEnum == CPTScatterPlotFieldX)
    {
        // Return x value, which will, depending on index, be between -4 to 4
        return [NSNumber numberWithInt: x];
    } else {
        // Return y value, for this example we'll be plotting y = x * x
        return [NSNumber numberWithInt: x * x];
    }
}

@end
