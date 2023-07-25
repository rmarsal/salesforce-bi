- dashboard: rep_performance
  title: Rep Performance
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
    listen:
      Sales Rep: opportunity_owner.name
    row: 2
    col: 0
    width: 6
    height: 4
  - title: Lifetime Bookings
    name: Lifetime Bookings
    model: salesforce
    explore: opportunities
    type: single_value
    fields: [opportunities.total_amount]
    filters:
      opportunities.is_won: 'Yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Opps Won
    font_size: small
    listen:
      Sales Rep: opportunity_owner.name
    row: 2
    col: 18
    width: 6
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
    listen:
      Sales Rep: opportunity_owner.name
    row: 2
    col: 12
    width: 6
    height: 4
  - title: Pipeline QTD
    name: Pipeline QTD
    model: salesforce
    explore: opportunities
    type: single_value
    fields: [opportunities.total_pipeline_amount]
    filters:
      opportunities.close_date: this fiscal quarter
      opportunity_owner.manager: ''
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: ''
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs. Last Quarter
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    filter_expression: |-
      # Only compare QTDs
      ${opportunities.day_of_fiscal_quarter} <= ${opportunities.current_day_of_fiscal_quarter}
    font_size: small
    hidden_fields:
    listen:
      Sales Rep: opportunity_owner.name
    row: 2
    col: 6
    width: 6
    height: 4
  - title: Win Percentage By Deal Size
    name: Win Percentage By Deal Size
    model: salesforce
    explore: opportunities
    type: looker_pie
    fields: [opportunities.win_percentage, opportunities.deal_size_tier, opportunities.sort_deal_size]
    filters:
      opportunities.win_percentage: ">0"
    sorts: [opportunities.deal_size_tier]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    series_colors:
      opportunities.win_percentage: "#B1399E"
      "$0 - $10K": "#75E2E2"
      "$10K - $50K": "#FBB555"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: opportunities.win_percentage,
            id: opportunities.win_percentage, name: Win Percentage}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    font_size: small
    series_types: {}
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    hidden_fields: [opportunities.sort_deal_size]
    listen:
      Sales Rep: opportunity_owner.name
    row: 14
    col: 8
    width: 7
    height: 8
  - title: Closed Won Opportunities
    name: Closed Won Opportunities
    model: salesforce
    explore: opportunities
    type: looker_grid
    fields: [opportunities.name, opportunities.close_date, opportunities.days_as_customer,
      opportunities.total_closed_won_amount, opportunities.type, opportunities.lead_source]
    filters:
      opportunities.close_date: before 0 minutes ago
    sorts: [opportunities.close_date desc]
    limit: 50
    column_limit: 50
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      account.logo64: Logo
    series_cell_visualizations:
      opportunities.total_closed_won_amount:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    font_size: small
    series_types: {}
    listen:
      Sales Rep: opportunity_owner.name
    row: 22
    col: 0
    width: 24
    height: 7
  - title: Rep Name
    name: Rep Name
    model: salesforce
    explore: opportunities
    type: single_value
    fields: [opportunity_owner.name]
    filters: {}
    sorts: [opportunity_owner.name]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Opps Won
    font_size: small
    listen:
      Sales Rep: opportunity_owner.name
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Opportunities By Stage
    name: Opportunities By Stage
    model: salesforce
    explore: opportunities
    type: looker_column
    fields: [opportunities.stage_name, opportunities.total_amount, opportunities.count]
    filters:
      opportunities.total_amount: ">0"
      opportunities.is_closed: 'No'
    sorts: [opportunities.total_amount desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: opportunities.total_amount,
            id: opportunities.total_amount, name: Total Amount}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: opportunities.count,
            id: opportunities.count, name: Number of Opportunities}], showLabels: false,
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
    series_types:
      opportunities.count: line
    point_style: none
    series_colors:
      opportunities.total_amount: "#9174F0"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Sales Rep: opportunity_owner.name
    row: 14
    col: 0
    width: 8
    height: 8
  - title: Open Opportunities
    name: Open Opportunities
    model: salesforce
    explore: opportunities
    type: looker_grid
    fields: [opportunities.name, opportunities.type, opportunities.created_date, opportunities.close_date,
      opportunities.stage_name, opportunities.days_open, opportunities.next_step, opportunities.amount]
    filters:
      opportunities.is_pipeline: 'Yes'
      opportunity_owner.manager: ''
      opportunities.type: ''
    sorts: [opportunities.close_date]
    limit: 500
    column_limit: 50
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      opportunities.amount:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    subtotals_at_bottom: false
    hide_totals: false
    hide_row_totals: false
    series_types: {}
    hidden_fields: [opportunities.first_meeting_date, opportunity_history_days_in_current_stage.most_recent_stage_change_date_date,
      opportunity_history_days_in_current_stage.most_recent_stage_change_date]
    listen:
      Sales Rep: opportunity_owner.name
    row: 14
    col: 15
    width: 9
    height: 8
  - title: Cumulative Bookings (QTD)
    name: Cumulative Bookings (QTD)
    model: salesforce
    explore: opportunities
    type: looker_column
    fields: [opportunities.total_amount, opportunities.close_date]
    fill_fields: [opportunities.close_date]
    filters:
      opportunities.close_date: 1 quarters
      opportunities.is_won: 'Yes'
    sorts: [opportunities.close_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: running_total, label: Running Total, expression: 'running_total(${opportunities.total_amount})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: is_before_today_2, label: Is Before Today, expression: 'if(now()
          < ${opportunities.close_date}, no, yes)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: yesno}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: 'true'
    y_axes: [{label: '', orientation: left, series: [{axisId: opportunities.total_amount,
            id: opportunities.total_amount, name: Closed Won Amount}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: running_total,
            id: running_total, name: Running Total}], showLabels: false, showValues: false,
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types:
      running_total: area
    point_style: none
    series_labels:
      opportunities.total_amount: Closed Won Amount
    show_value_labels: true
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: Gap
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [opportunities.total_closed_won_new_business_amount]
    hidden_points_if_no: [is_before_today_2]
    listen:
      Sales Rep: opportunity_owner.name
    row: 6
    col: 0
    width: 15
    height: 8
  - title: Biggest Wins (All Time)
    name: Biggest Wins (All Time)
    model: salesforce
    explore: opportunities
    type: looker_bar
    fields: [account.logo64, opportunities.total_amount]
    filters:
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
      opportunities.total_amount: "#C762AD"
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
    listen:
      Sales Rep: opportunity_owner.name
    row: 6
    col: 15
    width: 9
    height: 8
  filters:
  - name: Sales Rep
    title: Sales Rep
    type: field_filter
    default_value:
    allow_multiple_values: true
    required: false
    model: salesforce
    explore: opportunities
    listens_to_filters: []
    field: opportunity_owner.name
