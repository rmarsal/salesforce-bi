- dashboard: sales_overview
  title: Sales Overview
  layout: newspaper
  elements:
  - title: Bookings (QTD)
    name: Bookings (QTD)
    model: salesforce
    explore: opportunities
    type: single_value
    fields: [opportunities.total_amount, opportunities.close_fiscal_quarter]
    pivots: [opportunities.close_fiscal_quarter]
    fill_fields: [opportunities.close_fiscal_quarter]
    filters:
      opportunities.close_date: this fiscal quarter, last fiscal quarter
      opportunities.is_won: 'Yes'
    sorts: [opportunities.close_fiscal_quarter desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: Change, expression: "(pivot_index(${opportunities.total_amount},\
          \ 1) - pivot_index(${opportunities.total_amount}, 2))/pivot_index(${opportunities.total_amount},\
          \ 2)", value_format: !!null '', value_format_name: percent_1, _kind_hint: supermeasure,
        _type_hint: number}]
    filter_expression: |-
      # Only compare QTDs
      ${opportunities.day_of_fiscal_quarter} <= ${opportunities.current_day_of_fiscal_quarter}
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: ''
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: small
    series_types: {}
    hidden_fields:
    row: 0
    col: 0
    width: 3
    height: 4
  - title: Closed Won Opps
    name: Closed Won Opps
    model: salesforce
    explore: opportunities
    type: single_value
    fields: [opportunities.count]
    filters:
      opportunities.is_won: 'Yes'
      opportunities.is_closed: 'Yes'
    sorts: [opportunities.total_closed_won_new_business_amount desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Quota
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: small
    series_types: {}
    hidden_fields: []
    row: 0
    col: 3
    width: 3
    height: 4
  - title: Top 10 Reps This Quarter
    name: Top 10 Reps This Quarter
    model: salesforce
    explore: opportunities
    type: looker_bar
    fields: [opportunity_owner.name, opportunities.total_amount]
    filters:
      opportunities.total_amount: ">0"
      opportunities.close_date: this quarter
      opportunities.is_won: 'Yes'
    sorts: [opportunities.total_amount desc]
    limit: 10
    column_limit: 50
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: opportunities.total_amount,
            id: opportunities.total_amount, name: Total Amount}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      opportunities.total_amount: "#EE9093"
    series_labels:
      opportunities.total_new_closed_won_amount_qtd: Closed Won
      opportunities.total_pipeline_amount: Pipeline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: []}, {type: less than, value: 1, background_color: "#F36254", font_color: !!null '',
        color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5, constraints: {max: {type: number, value: 0.1}, min: {
                type: number, value: 0}, mid: {type: number, value: 0.5}}}}, bold: false,
        italic: false, strikethrough: false, fields: []}, {type: between, value: [
          1, 2], background_color: "#FCF758", font_color: !!null '', color_application: {
          collection_id: legacy, palette_id: legacy_diverging1}, bold: false, italic: false,
        strikethrough: false, fields: []}, {type: greater than, value: 2, background_color: "#4FBC89",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1},
        bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    subtotals_at_bottom: false
    hidden_fields: [opportunities.total_new_closed_won_amount_qtd]
    listen: {}
    row: 4
    col: 0
    width: 6
    height: 9
  - title: Task Breakdown
    name: Task Breakdown
    model: salesforce
    explore: opportunities
    type: looker_column
    fields: [task.created_month, task.calls, task.emails, task.meetings]
    fill_fields: [task.created_month]
    filters:
      task.created_month: 12 months
    sorts: [task.created_month desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: task.calls, id: task.calls,
            name: Calls}, {axisId: task.emails, id: task.emails, name: Emails}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: task.meetings,
            id: task.meetings, name: Meetings}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types:
      opportunities.win_percentage: line
      task.meetings: line
    point_style: circle
    series_colors:
      task.calls: "#FFB690"
      task.emails: "#EE9093"
      task.meetings: "#C762AD"
    series_point_styles:
      opportunities.win_percentage: square
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 23
    col: 0
    width: 6
    height: 8
  - title: Closed Deals by Opportunity Type
    name: Closed Deals by Opportunity Type
    model: salesforce
    explore: opportunities
    type: looker_column
    fields: [opportunities.close_quarter, opportunities.type, opportunities.total_amount]
    pivots: [opportunities.type]
    fill_fields: [opportunities.close_quarter]
    filters:
      opportunities.close_fiscal_quarter: 4 fiscal quarters
      opportunities.is_won: 'Yes'
    sorts: [opportunities.close_quarter, opportunities.type 0]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: a418cd33-fecf-4932-9933-dbd6652c610b
      options:
        steps: 5
        reverse: true
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: Amount in Pipeline, orientation: left, series: [{id: Won - 0
              - opportunities.total_pipeline_amount, name: Won, axisId: Won - 0 - opportunities.total_pipeline_amount},
          {id: Above 80% - 1 - opportunities.total_pipeline_amount, name: Above 80%,
            axisId: Above 80% - 1 - opportunities.total_pipeline_amount}, {id: 60 -
              80% - 2 - opportunities.total_pipeline_amount, name: 60 - 80%, axisId: 60
              - 80% - 2 - opportunities.total_pipeline_amount}, {id: 40 - 60% - 3 -
              opportunities.total_pipeline_amount, name: 40 - 60%, axisId: 40 - 60%
              - 3 - opportunities.total_pipeline_amount}, {id: 20 - 40% - 4 - opportunities.total_pipeline_amount,
            name: 20 - 40%, axisId: 20 - 40% - 4 - opportunities.total_pipeline_amount},
          {id: Under 20% - 5 - opportunities.total_pipeline_amount, name: Under 20%,
            axisId: Under 20% - 5 - opportunities.total_pipeline_amount}, {id: Lost
              - 6 - opportunities.total_pipeline_amount, name: Lost, axisId: Lost -
              6 - opportunities.total_pipeline_amount}], showLabels: false, showValues: false,
        valueFormat: '$0.0,, "M"', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: ''
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    hidden_series: [Lost - 6 - opportunities.total_revenue, Under 20% - 5 - opportunities.total_revenue,
      Won - 0 - opportunities.total_pipeline_amount, Lost - 6 - opportunities.total_pipeline_amount,
      Closed Won - 6 - opportunities.total_pipeline_amount]
    legend_position: right
    label_value_format: ''
    series_types: {}
    point_style: none
    series_colors:
      Upgrade - opportunities.total_amount: "#FED8A0"
      Seat Upsell - opportunities.total_amount: "#FFB690"
    show_value_labels: false
    label_density: 25
    label_color: ["#FFFFFF"]
    x_axis_scale: ordinal
    x_axis_datetime_label: ''
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#707070"
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 23
    col: 6
    width: 12
    height: 8
  - title: Top 5 Managers This Quarter
    name: Top 5 Managers This Quarter
    model: salesforce
    explore: opportunities
    type: looker_bar
    fields: [opportunities.total_amount, opportunity_owner.manager]
    filters:
      opportunities.total_amount: ">0"
      opportunities.close_date: this quarter
      opportunities.is_won: 'Yes'
    sorts: [opportunities.total_amount desc]
    limit: 10
    column_limit: 50
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: opportunities.total_amount,
            id: opportunities.total_amount, name: Total Amount}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      opportunities.total_amount: "#FD9577"
    series_labels:
      opportunities.total_new_closed_won_amount_qtd: Closed Won
      opportunities.total_pipeline_amount: Pipeline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: []}, {type: less than, value: 1, background_color: "#F36254", font_color: !!null '',
        color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5, constraints: {max: {type: number, value: 0.1}, min: {
                type: number, value: 0}, mid: {type: number, value: 0.5}}}}, bold: false,
        italic: false, strikethrough: false, fields: []}, {type: between, value: [
          1, 2], background_color: "#FCF758", font_color: !!null '', color_application: {
          collection_id: legacy, palette_id: legacy_diverging1}, bold: false, italic: false,
        strikethrough: false, fields: []}, {type: greater than, value: 2, background_color: "#4FBC89",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1},
        bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    subtotals_at_bottom: false
    hidden_fields: [opportunities.total_new_closed_won_amount_qtd]
    listen: {}
    row: 13
    col: 0
    width: 6
    height: 10
  - title: Won Amount Running Total with Win %
    name: Won Amount Running Total with Win %
    model: salesforce
    explore: opportunities
    type: looker_line
    fields: [opportunities.close_week, opportunities.win_percentage, opportunities.total_closed_won_amount]
    fill_fields: [opportunities.close_week]
    filters:
      opportunities.close_week: 6 months
    sorts: [opportunities.close_week]
    limit: 500
    dynamic_fields: [{table_calculation: running_total_won_amount, label: Running
          Total Won Amount, expression: 'running_total(${opportunities.total_closed_won_amount})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: opportunities.total_amount,
            id: opportunities.total_amount, name: Total Amount}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: !!null '', orientation: right, series: [{axisId: opportunities.win_percentage,
            id: opportunities.win_percentage, name: Win Percentage}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types:
      opportunities.total_amount: area
      running_total_won_amount: area
    point_style: none
    series_colors:
      running_total_won_amount: "#B1399E"
      opportunities.win_percentage: "#592EC2"
    series_labels:
      opportunities.win_percentage: Win %
      running_total_won_amount: Won Amount
    series_point_styles: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    hidden_fields: [opportunities.total_closed_won_amount]
    listen: {}
    row: 0
    col: 6
    width: 18
    height: 13
  - title: Won Opps (QTD)
    name: Won Opps (QTD)
    model: salesforce
    explore: opportunities
    type: looker_grid
    fields: [opportunities.name, account.industry, opportunity_owner.manager, opportunities.close_date,
      opportunities.type, opportunities.days_to_closed_won, opportunities.total_amount,
      task.emails]
    filters:
      opportunities.close_date: 1 quarters
      opportunities.is_closed: 'Yes'
      opportunities.is_won: 'Yes'
    sorts: [opportunities.total_amount desc]
    limit: 500
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_column_widths:
      opportunities.days_to_closed_won: 155
      opportunities.total_amount: 197
      account.domain: 161
      opportunity_owner.manager: 651
      account.industry: 130
      task.meetings: 957
    series_cell_visualizations:
      opportunities.total_amount:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          custom: {id: ad119b7f-b421-0d4d-f207-99d61bc9c2bb, label: Custom, type: continuous,
            stops: [{color: "#E57947", offset: 0}, {color: "#FBB555", offset: 50},
              {color: "#ffffff", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [opportunities.days_to_closed_won]}, {type: along
          a scale..., value: !!null '', background_color: "#3EB0D5", font_color: !!null '',
        color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, custom: {
            id: 4d9bbf35-831c-dd55-8633-a091a521d740, label: Custom, type: continuous,
            stops: [{color: "#E57947", offset: 0}, {color: "#FBB555", offset: 50},
              {color: "#ffffff", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [opportunities.total_amount]}, {type: along a
          scale..., value: !!null '', background_color: "#3EB0D5", font_color: !!null '',
        color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7, custom: {
            id: 06a4cce9-8f75-eff6-6426-a3dbf1ddb035, label: Custom, type: continuous,
            stops: [{color: "#E57947", offset: 0}, {color: "#FBB555", offset: 50},
              {color: "#ffffff", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [task.meetings]}, {type: along a scale..., value: !!null '',
        background_color: "#3EB0D5", font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          custom: {id: f7e36d8a-f4e9-aaf2-683a-f0d66106c3fb, label: Custom, type: continuous,
            stops: [{color: "#E57947", offset: 0}, {color: "#FBB555", offset: 50},
              {color: "#ffffff", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: -3}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [task.emails]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 31
    col: 0
    width: 24
    height: 12
  - title: Bookings by Lead Source
    name: Bookings by Lead Source
    model: salesforce
    explore: opportunities
    type: looker_bar
    fields: [opportunities.lead_source, opportunities.total_amount]
    filters:
      opportunities.total_amount: ">0"
      opportunities.close_date: this quarter
      opportunities.is_won: 'Yes'
      opportunities.lead_source: "-NULL"
    sorts: [opportunities.total_amount desc]
    limit: 10
    column_limit: 50
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: opportunities.average_amount_won,
            id: opportunities.average_amount_won, name: Average Amount Won}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      opportunities.total_amount: "#9F4AB4"
    series_labels:
      opportunities.total_new_closed_won_amount_qtd: Closed Won
      opportunities.total_pipeline_amount: Pipeline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: []}, {type: less than, value: 1, background_color: "#F36254", font_color: !!null '',
        color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5, constraints: {max: {type: number, value: 0.1}, min: {
                type: number, value: 0}, mid: {type: number, value: 0.5}}}}, bold: false,
        italic: false, strikethrough: false, fields: []}, {type: between, value: [
          1, 2], background_color: "#FCF758", font_color: !!null '', color_application: {
          collection_id: legacy, palette_id: legacy_diverging1}, bold: false, italic: false,
        strikethrough: false, fields: []}, {type: greater than, value: 2, background_color: "#4FBC89",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1},
        bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    subtotals_at_bottom: false
    hidden_fields: [opportunities.total_new_closed_won_amount_qtd]
    listen: {}
    row: 23
    col: 18
    width: 6
    height: 8
  - title: Bookings by State
    name: Bookings by State
    model: salesforce
    explore: opportunities
    type: looker_map
    fields: [account.billing_state, opportunities.total_closed_won_amount]
    filters:
      account.billing_country: USA,United States
      opportunities.close_fiscal_quarter: this quarter
      opportunities.is_won: 'Yes'
    sorts: [account.billing_state]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 38.89103282648846
    map_longitude: -96.9291114807129
    map_zoom: 4
    map_scale_indicator: 'off'
    map_pannable: false
    map_zoomable: false
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    map_value_colors: ["#170658", "#a49bc1"]
    quantize_map_value_colors: false
    reverse_map_value_colors: true
    series_types: {}
    row: 13
    col: 6
    width: 12
    height: 10
  - title: Biggest Wins
    name: Biggest Wins
    model: salesforce
    explore: opportunities
    type: looker_bar
    fields: [opportunities.total_amount, account.name]
    filters:
      opportunities.is_won: 'Yes'
    sorts: [opportunities.total_amount desc]
    limit: 5
    column_limit: 50
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      custom:
        id: a168681c-ceaf-aafc-f70f-cb3109b3c060
        label: Custom
        type: continuous
        stops:
        - color: "#462C9D"
          offset: 0
        - color: "#462C9D"
          offset: 100
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{id: opportunities.total_closed_won_new_business_amount,
            name: 'Closed Won ACV ', axisId: opportunities.total_closed_won_new_business_amount}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    font_size: small
    series_types: {}
    point_style: none
    series_colors:
      opportunities.total_closed_won_new_business_amount: "#462C9D"
      opportunities.total_amount: "#D978A1"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    enable_conditional_formatting: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [opportunities.name_id]
    listen: {}
    row: 13
    col: 18
    width: 6
    height: 10
