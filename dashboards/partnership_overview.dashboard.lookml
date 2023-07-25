- dashboard: partnerhip_overview
  title: Partnership Overview
  layout: newspaper
  elements:
  - title: Partnership Signed
    name: Partnership Signed
    model: salesforce
    explore: partnerships
    type: single_value
    fields: [partnerships.count]
    filters:
      partnerships.stage_c: Launched Campaign
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: [partnerships.total_closed_won_new_business_amount, quota_numbers.quarterly_aggregate_quota_measure,
      aggregate_quota.monthly_aggregate_quota_measure]
    y_axes: []
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Pipeline Created QTD
    name: Pipeline Created QTD
    model: salesforce
    explore: partnerships
    type: single_value
    fields: [partnerships.total_pipeline_amount]
    filters:
      partnerships.created_date: this month
      partnerships.type: ''
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: [partnerships.total_closed_won_new_business_amount, quota_numbers.quarterly_aggregate_quota_measure,
      aggregate_quota.monthly_aggregate_quota_measure]
    y_axes: []
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 0
    col: 6
    width: 6
    height: 3
  - title: Partnerships by Probability and Close Date
    name: Partnerships by Probability and Close Date
    model: salesforce
    explore: partnerships
    type: looker_column
    fields: [partnerships.probability_group, partnerships.count, partnerships.close_month]
    pivots: [partnerships.probability_group]
    fill_fields: [partnerships.probability_group, partnerships.close_month]
    filters:
      partnerships.is_pipeline: 'Yes'
      partnerships.close_date: 0 months ago for 6 months
      partnerships.type: ''
    sorts: [partnerships.probability_group, partnerships.close_month desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: f582184b-9f56-4e5b-b1ab-e9777faa4df9
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: '', orientation: left, series: [{id: Develop - partnerships.count_new_business,
            name: Develop, axisId: Develop - partnerships.count_new_business}, {id: Develop
              Positive - partnerships.count_new_business, name: Develop Positive, axisId: Develop
              Positive - partnerships.count_new_business}, {id: Negotiate - partnerships.count_new_business,
            name: Negotiate, axisId: Negotiate - partnerships.count_new_business},
          {id: Qualify - partnerships.count_new_business, name: Qualify, axisId: Qualify
              - partnerships.count_new_business}, {id: Qualify Renewal - partnerships.count_new_business,
            name: Qualify Renewal, axisId: Qualify Renewal - partnerships.count_new_business},
          {id: Validate - partnerships.count_new_business, name: Validate, axisId: Validate
              - partnerships.count_new_business}], showLabels: false, showValues: false,
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
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 11
    col: 12
    width: 12
    height: 9
  - title: Partnerships in Pipeline
    name: Partnerships in Pipeline
    model: salesforce
    explore: partnerships
    type: single_value
    fields: [partnerships.count]
    filters:
      partnerships.type: ''
      partnerships.is_pipeline: 'Yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: [partnerships.total_closed_won_new_business_amount, quota_numbers.quarterly_aggregate_quota_measure,
      aggregate_quota.monthly_aggregate_quota_measure]
    y_axes: []
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 0
    col: 12
    width: 6
    height: 3
  - title: Avg Deal Size in Pipeline
    name: Avg Deal Size in Pipeline
    model: salesforce
    explore: partnerships
    type: single_value
    fields: [partnerships.average_amount]
    filters:
      partnerships.is_pipeline: 'Yes'
    limit: 500
    column_limit: 50
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 0
    col: 18
    width: 6
    height: 3
  - title: List of Partnerships in Pipeline
    name: List of Partnerships in Pipeline
    model: salesforce
    explore: partnerships
    type: looker_grid
    fields: [partnerships.name, opportunity_owner.name, partnerships.created_date,
      partnerships.stage_c, partnerships.days_open]
    filters:
      partnerships.is_pipeline: 'Yes'
      partnerships.type: ''
    sorts: [partnerships.close_date]
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
      partnerships.amount:
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
    hidden_fields: [partnerships.first_meeting_date, opportunity_history_days_in_current_stage.most_recent_stage_change_date_date,
      opportunity_history_days_in_current_stage.most_recent_stage_change_date]
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 32
    col: 0
    width: 24
    height: 6
  - title: Avg Deal Size in Pipeline by Manager
    name: Avg Deal Size in Pipeline by Manager
    model: salesforce
    explore: partnerships
    type: looker_bar
    fields: [opportunity_owner.manager, partnerships.average_amount]
    filters:
      partnerships.is_pipeline: 'Yes'
    sorts: [partnerships.average_amount desc]
    limit: 20
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: partnerships.average_amount,
            id: partnerships.average_amount, name: Average Amount}], showLabels: true,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear}]
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
      partnerships.average_amount: "#E57947"
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
      Manager: opportunity_owner.manager
    row: 20
    col: 0
    width: 12
    height: 12
  - title: Pipeline By Manager
    name: Pipeline By Manager
    model: salesforce
    explore: partnerships
    type: looker_bar
    fields: [opportunity_owner.name, partnerships.count]
    sorts: [partnerships.count desc]
    limit: 20
    column_limit: 50
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: partnerships.count, id: partnerships.count,
            name: Number of Partnerships}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: partnerships.total_pipeline_amount,
            id: partnerships.total_pipeline_amount, name: Pipeline Amount}], showLabels: false,
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
      partnerships.total_pipeline_amount: line
    point_style: circle
    series_colors:
      partnerships.count: "#E57947"
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
      Manager: opportunity_owner.manager
    row: 20
    col: 12
    width: 12
    height: 12
  - title: Partnerships by Stage and Lead Source
    name: Partnerships by Stage and Lead Source
    model: salesforce
    explore: partnerships
    type: looker_column
    fields: [partnerships.stage_c, partnerships.count]
    filters:
      partnerships.is_pipeline: 'Yes'
      partnerships.close_fiscal_quarter: this fiscal quarter
      partnerships.lead_source: "-NULL"
    sorts: [partnerships.count desc 6, partnerships.stage_name 0]
    limit: 5000
    column_limit: 8
    row_total: right
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: f582184b-9f56-4e5b-b1ab-e9777faa4df9
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: '', orientation: bottom, series: [{id: Develop - partnerships.count_new_business,
            name: Develop, axisId: Develop - partnerships.count_new_business}, {id: Develop
              Positive - partnerships.count_new_business, name: Develop Positive, axisId: Develop
              Positive - partnerships.count_new_business}, {id: Negotiate - partnerships.count_new_business,
            name: Negotiate, axisId: Negotiate - partnerships.count_new_business},
          {id: Qualify - partnerships.count_new_business, name: Qualify, axisId: Qualify
              - partnerships.count_new_business}, {id: Qualify Renewal - partnerships.count_new_business,
            name: Qualify Renewal, axisId: Qualify Renewal - partnerships.count_new_business},
          {id: Validate - partnerships.count_new_business, name: Validate, axisId: Validate
              - partnerships.count_new_business}], showLabels: false, showValues: false,
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
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: asc
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 11
    col: 0
    width: 12
    height: 9
  - title: Won vs Created Partnerships - Week Cohort
    name: add_a_unique_name_1689163504
    model: salesforce
    explore: partnerships
    type: looker_line
    fields: [partnerships.created_week, partnerships.count, partnership_launched]
    fill_fields: [partnerships.created_week]
    filters:
      opportunity_owner.name: ''
      opportunity_owner.manager: ''
    sorts: [partnerships.created_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - args:
      - partnerships.count
      calculation_type: percent_of_column_sum
      category: table_calculation
      based_on: partnerships.count
      label: Percent of Partnerships Count
      source_field: partnerships.count
      table_calculation: percent_of_partnerships_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
    - category: measure
      label: Partnership Launched
      based_on: partnerships.count
      _kind_hint: measure
      measure: partnership_launched
      type: count_distinct
      _type_hint: number
      filters:
        partnerships.stage_c: Launched Campaign
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
        __FILE: salesforce/dashboards/partnership_overview.dashboard.lookml
        __LINE_NUM: 414
    y_axes: [{label: '', orientation: left, series: [{id: partnerships.days_open, name: Opportunity
              Days Open, axisId: partnerships.days_open, __FILE: salesforce/dashboards/partnership_overview.dashboard.lookml,
            __LINE_NUM: 418}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, type: linear, __FILE: salesforce/dashboards/partnership_overview.dashboard.lookml,
        __LINE_NUM: 418}]
    size_by_field: partnerships.amount
    hide_legend: false
    series_colors:
      partnerships.days_open: "#EE9093"
    x_axis_datetime_label: ''
    hidden_fields:
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_pivots: {}
    row: 3
    col: 0
    width: 24
    height: 8
