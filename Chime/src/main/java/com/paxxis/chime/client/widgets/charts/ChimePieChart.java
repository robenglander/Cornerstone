package com.paxxis.chime.client.widgets.charts;

import com.extjs.gxt.ui.client.widget.layout.RowData;
import com.extjs.gxt.ui.client.widget.layout.RowLayout;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.DeferredCommand;
import com.google.gwt.visualization.client.DataTable;
import com.google.gwt.visualization.client.LegendPosition;
import com.google.gwt.visualization.client.visualizations.PieChart;
import com.paxxis.chime.client.common.portal.PortletSpecification;

public class ChimePieChart extends ChimeChart {

	private PieChart chart;
    private PieChart.Options options = PieChart.Options.create();
	
	ChimePieChart(PortletSpecification spec) {
		super(spec);
	}
	
	@Override
	protected void init() {
		super.init();
		setBorders(false);
        setLayout(new RowLayout());

        PortletSpecification spec = getSpecification();
	    options.setHeight(-1);
	    options.setWidth(-1);
	    options.setTitleFontSize(14.0); 
	    options.setTitle(spec.getProperty("field").toString());
	    options.setLegend(LegendPosition.NONE);
	    options.setTitle(spec.getProperty("title").toString());
	    options.setEnableTooltip(true);
	    
	    DataTable data = getData();
	    data.addRow();
	    data.setValue(0, 0, "??");
	    data.setValue(0, 1, 0);
	    chart = new PieChart(data, options);
	    
	    add(chart, new RowData(1, -1));
	}

	public void redraw() {
		DeferredCommand.addCommand(
			new Command() {
				public void execute() {
			    	int val = getWidth() - 2;
					options.setWidth(val);
			    	
					if (!makeSquare()) {
						val = getHeight();
					}
					
					options.setHeight(val);

					chart.draw(getData(), options);
				}
			}
		);
	}
}



