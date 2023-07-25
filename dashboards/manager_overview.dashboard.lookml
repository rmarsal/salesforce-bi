- dashboard: manager_overview
  title: Manager Overview
  layout: newspaper
  elements:
  - title: Total Bookings
    name: Total Bookings
    model: salesforce
    explore: opportunities
    type: single_value
    fields: [opportunities.total_amount]
    filters: {}
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
      Manager: opportunity_owner.manager
      Close Date: opportunities.close_date
    row: 0
    col: 6
    width: 6
    height: 3
  - title: Opportunities Won
    name: Opportunities Won
    model: salesforce
    explore: opportunities
    type: single_value
    fields: [opportunities.close_fiscal_quarter, opportunities.count_won]
    pivots: [opportunities.close_fiscal_quarter]
    fill_fields: [opportunities.close_fiscal_quarter]
    filters: {}
    sorts: [opportunities.close_fiscal_quarter desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: Change, expression: 'pivot_index(${opportunities.count_won},
          1) - pivot_index(${opportunities.count_won}, 2)', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: supermeasure, _type_hint: number}]
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
      Manager: opportunity_owner.manager
      Close Date: opportunities.close_date
    row: 0
    col: 12
    width: 6
    height: 3
  - title: Rep Performance
    name: Rep Performance
    model: salesforce
    explore: opportunities
    type: looker_grid
    fields: [opportunity_owner.name, opportunity_owner.tenure, opportunity_owner.title,
      opportunities.total_pipeline_amount, opportunities.total_amount]
    filters: {}
    sorts: [opportunities.total_pipeline_amount desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      opportunities.total_new_closed_won_amount_qtd: Closed Won
      opportunities.total_pipeline_amount: Pipeline
    series_cell_visualizations:
      opportunities.total_pipeline_amount:
        is_active: true
      opportunities.total_amount:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    subtotals_at_bottom: false
    series_types: {}
    hidden_fields: [opportunities.total_new_closed_won_amount_qtd]
    listen:
      Manager: opportunity_owner.manager
      Close Date: opportunities.close_date
    row: 27
    col: 12
    width: 12
    height: 9
  - title: Pipeline Created
    name: Pipeline Created
    model: salesforce
    explore: opportunities
    type: single_value
    fields: [opportunities.total_pipeline_amount]
    filters: {}
    sorts: [opportunities.total_pipeline_new_business_amount desc]
    limit: 500
    column_limit: 50
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
    show_view_names: 'true'
    hidden_fields: [opportunities.total_closed_won_new_business_amount]
    listen:
      Manager: opportunity_owner.manager
      Close Date: opportunities.close_date
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Cumulative Bookings By Rep
    name: Cumulative Bookings By Rep
    model: salesforce
    explore: opportunities
    type: looker_area
    fields: [opportunities.close_date, opportunities.total_amount, owner_opp_sorted.name]
    pivots: [owner_opp_sorted.name]
    filters:
      opportunities.is_won: 'Yes'
    sorts: [opportunities.close_date, owner_opp_sorted.name desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: running_total, label: Running Total, expression: 'running_total(${opportunities.total_amount})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: 'true'
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
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    hidden_fields: [opportunities.total_closed_won_new_business_amount, opportunities.total_amount]
    listen:
      Manager: opportunity_owner.manager
      Close Date: opportunities.close_date
    row: 3
    col: 0
    width: 24
    height: 8
  - title: Win Percentage
    name: Win Percentage
    model: salesforce
    explore: opportunities
    type: single_value
    fields: [opportunities.close_fiscal_quarter, opportunities.win_percentage]
    pivots: [opportunities.close_fiscal_quarter]
    fill_fields: [opportunities.close_fiscal_quarter]
    filters: {}
    sorts: [opportunities.close_fiscal_quarter desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: Change, expression: "(pivot_index(${opportunities.win_percentage},\
          \ 1) - pivot_index(${opportunities.win_percentage}, 2))/pivot_index(${opportunities.win_percentage},\
          \ 2)", value_format: !!null '', value_format_name: percent_0, _kind_hint: supermeasure,
        _type_hint: number}]
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
      Manager: opportunity_owner.manager
      Close Date: opportunities.close_date
    row: 0
    col: 18
    width: 6
    height: 3
  - title: Avg Days To Close By Rep
    name: Avg Days To Close By Rep
    model: salesforce
    explore: opportunities
    type: looker_bar
    fields: [opportunities.average_days_to_closed_won, opportunity_owner.name]
    filters:
      opportunities.total_amount: ">0"
    sorts: [opportunities.average_days_to_closed_won desc]
    limit: 12
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: opportunities.average_days_to_closed_won,
            id: opportunities.average_days_to_closed_won, name: Average Days to Closed
              Won}], showLabels: true, showValues: false, unpinAxis: false, tickDensity: default,
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
    series_types: {}
    point_style: none
    series_colors:
      opportunities.average_days_to_closed_won: "#592EC2"
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
    listen:
      Manager: opportunity_owner.manager
      Close Date: opportunities.close_date
    row: 11
    col: 0
    width: 8
    height: 8
  - title: Open Opportunities List
    name: Open Opportunities List
    model: salesforce
    explore: opportunities
    type: looker_grid
    fields: [opportunities.name, opportunities.type, opportunities.created_date, opportunities.close_date,
      opportunities.stage_name, opportunities.days_open, opportunities.next_step, opportunities.amount]
    filters:
      opportunities.is_pipeline: 'Yes'
      opportunity_owner.name: ''
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
    listen: {}
    row: 27
    col: 0
    width: 12
    height: 9
  - title: Opportunities Won By Rep
    name: Opportunities Won By Rep
    model: salesforce
    explore: opportunities
    type: looker_bar
    fields: [opportunity_owner.name, opportunities.count_won]
    filters:
      opportunities.count_won: ">0"
    sorts: [opportunities.count_won desc]
    limit: 12
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: opportunities.average_days_to_closed_won,
            id: opportunities.average_days_to_closed_won, name: Average Days to Closed
              Won}], showLabels: true, showValues: false, unpinAxis: false, tickDensity: default,
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
    series_types: {}
    point_style: none
    series_colors:
      opportunities.average_days_to_closed_won: "#592EC2"
      opportunities.count_won: "#592EC2"
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
    listen:
      Manager: opportunity_owner.manager
      Close Date: opportunities.close_date
    row: 11
    col: 8
    width: 9
    height: 8
  - title: Open Opportunities
    name: Open Opportunities
    model: salesforce
    explore: opportunities
    type: looker_scatter
    fields: [opportunities.name, opportunities.days_open, opportunities.total_amount, opportunity_owner.name,
      opportunities.days_open_with_opp_name_and_owner]
    sorts: [opportunities.total_amount desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Days Open
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
    point_style: circle_outline
    series_colors:
      opportunities.total_amount: "#592EC2"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    show_null_points: true
    hidden_fields: [opportunities.name, opportunity_owner.name, opportunities.days_open]
    listen: {}
    row: 19
    col: 0
    width: 24
    height: 8
  - title: Bookings Distribution
    name: Bookings Distribution
    model: salesforce
    explore: opportunities
    type: looker_bar
    fields: [opportunity_owner.name, opportunities.total_closed_won_amount]
    filters:
      opportunities.total_amount: ">0"
    sorts: [opportunities.total_closed_won_amount desc]
    limit: 12
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
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
    series_types: {}
    point_style: none
    series_colors:
      opportunities.average_amount_won: "#592EC2"
      opportunities.total_closed_won_amount: "#592EC2"
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
    listen:
      Manager: opportunity_owner.manager
      Close Date: opportunities.close_date
    row: 11
    col: 17
    width: 7
    height: 8
  filters:
  - name: Manager
    title: Manager
    type: field_filter
    default_value:
    allow_multiple_values: true
    required: false
    model: salesforce
    explore: opportunities
    listens_to_filters: []
    field: opportunity_owner.manager
  - name: Close Date
    title: Close Date
    type: field_filter
    default_value: this quarter
    allow_multiple_values: true
    required: false
    model: salesforce
    explore: opportunities
    listens_to_filters: []
    field: opportunities.close_date
