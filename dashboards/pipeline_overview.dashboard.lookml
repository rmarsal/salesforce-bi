- dashboard: pipeline_overview
  title: Pipeline Overview
  layout: newspaper
  elements:
  - title: Pipeline Created MTD
    name: Pipeline Created MTD
    model: salesforce
    explore: opportunities
    type: single_value
    fields: [opportunities.total_pipeline_amount]
    filters:
      opportunities.created_date: this month
      opportunities.type: ''
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: [opportunities.total_closed_won_new_business_amount, quota_numbers.quarterly_aggregate_quota_measure,
      aggregate_quota.monthly_aggregate_quota_measure]
    y_axes: []
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Opportunities Won
    name: Opportunities Won
    model: salesforce
    explore: opportunities
    type: single_value
    fields: [opportunities.count]
    filters:
      opportunities.stage_name: First Campaign Published
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: [opportunities.total_closed_won_new_business_amount, quota_numbers.quarterly_aggregate_quota_measure,
      aggregate_quota.monthly_aggregate_quota_measure]
    y_axes: []
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 0
    col: 6
    width: 6
    height: 3
  - title: Opps by Probability and Close Date
    name: Opps by Probability and Close Date
    model: salesforce
    explore: opportunities
    type: looker_column
    fields: [opportunities.probability_group, opportunities.count, opportunities.close_month]
    pivots: [opportunities.probability_group]
    fill_fields: [opportunities.probability_group, opportunities.close_month]
    filters:
      opportunities.is_pipeline: 'Yes'
      opportunities.close_date: 0 months ago for 6 months
      opportunities.type: ''
    sorts: [opportunities.probability_group, opportunities.close_month desc]
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
    y_axes: [{label: '', orientation: left, series: [{id: Develop - opportunities.count_new_business,
            name: Develop, axisId: Develop - opportunities.count_new_business}, {id: Develop
              Positive - opportunities.count_new_business, name: Develop Positive, axisId: Develop
              Positive - opportunities.count_new_business}, {id: Negotiate - opportunities.count_new_business,
            name: Negotiate, axisId: Negotiate - opportunities.count_new_business},
          {id: Qualify - opportunities.count_new_business, name: Qualify, axisId: Qualify
              - opportunities.count_new_business}, {id: Qualify Renewal - opportunities.count_new_business,
            name: Qualify Renewal, axisId: Qualify Renewal - opportunities.count_new_business},
          {id: Validate - opportunities.count_new_business, name: Validate, axisId: Validate
              - opportunities.count_new_business}], showLabels: false, showValues: false,
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
  - title: Opps in Pipeline
    name: Opps in Pipeline
    model: salesforce
    explore: opportunities
    type: single_value
    fields: [opportunities.count]
    filters:
      opportunities.type: ''
      opportunities.is_pipeline: 'Yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: [opportunities.total_closed_won_new_business_amount, quota_numbers.quarterly_aggregate_quota_measure,
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
    explore: opportunities
    type: single_value
    fields: [opportunities.average_amount]
    filters:
      opportunities.is_pipeline: 'Yes'
    limit: 500
    column_limit: 50
    listen:
      Sales Rep: opportunity_owner.name
      Manager: opportunity_owner.manager
    row: 0
    col: 18
    width: 6
    height: 3
  - title: List of Opportunities in Pipeline
    name: List of Opportunities in Pipeline
    model: salesforce
    explore: opportunities
    type: looker_grid
    fields: [opportunities.name, opportunity_owner.name, opportunities.created_date, opportunities.close_date,
      opportunities.stage_name, opportunities.days_open]
    filters:
      opportunities.is_pipeline: 'Yes'
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
      Manager: opportunity_owner.manager
    row: 32
    col: 0
    width: 24
    height: 6
  - name: Won Opportunities by Sales
    title: Won Opportunities by Sales
    model: salesforce
    explore: opportunities
    type: looker_bar
    fields: [opportunity_owner.name, opportunities.count]
    filters:
      opportunity_owner.name: ''
      opportunity_owner.manager: ''
      opportunities.stage_name: First Campaign Published
    sorts: [opportunities.count desc]
    limit: 20
    column_limit: 50
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
        __FILE: salesforce/dashboards/pipeline_overview.dashboard.lookml
        __LINE_NUM: 281
    y_axes: [{label: '', orientation: left, series: [{axisId: opportunities.count, id: opportunities.count,
            name: Number of Opportunities, __FILE: salesforce/dashboards/pipeline_overview.dashboard.lookml,
            __LINE_NUM: 285}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: salesforce/dashboards/pipeline_overview.dashboard.lookml,
        __LINE_NUM: 285}, {label: !!null '', orientation: right, series: [{axisId: opportunities.total_pipeline_amount,
            id: opportunities.total_pipeline_amount, name: Pipeline Amount, __FILE: salesforce/dashboards/pipeline_overview.dashboard.lookml,
            __LINE_NUM: 288}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: salesforce/dashboards/pipeline_overview.dashboard.lookml,
        __LINE_NUM: 288}]
    series_colors:
      opportunities.count: "#E57947"
    defaults_version: 1
    row: 20
    col: 0
    width: 12
    height: 12
  - title: Pipeline By Sales
    name: Pipeline By Manager
    model: salesforce
    explore: opportunities
    type: looker_bar
    fields: [opportunity_owner.name, opportunities.count]
    sorts: [opportunities.count desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: opportunities.count, id: opportunities.count,
            name: Number of Opportunities}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: opportunities.total_pipeline_amount,
            id: opportunities.total_pipeline_amount, name: Pipeline Amount}], showLabels: false,
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
      opportunities.total_pipeline_amount: line
    point_style: circle
    series_colors:
      opportunities.count: "#E57947"
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
  - title: Opps by Stage and Lead Source
    name: Opps by Stage and Lead Source
    model: salesforce
    explore: opportunities
    type: looker_column
    fields: [opportunities.lead_source, opportunities.count, opportunities.stage_name]
    pivots: [opportunities.stage_name]
    filters:
      opportunities.is_pipeline: 'Yes'
      opportunities.close_fiscal_quarter: this fiscal quarter
      opportunities.lead_source: "-NULL"
    sorts: [opportunities.count desc 6, opportunities.stage_name 0]
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
    y_axes: [{label: '', orientation: bottom, series: [{id: Develop - opportunities.count_new_business,
            name: Develop, axisId: Develop - opportunities.count_new_business}, {id: Develop
              Positive - opportunities.count_new_business, name: Develop Positive, axisId: Develop
              Positive - opportunities.count_new_business}, {id: Negotiate - opportunities.count_new_business,
            name: Negotiate, axisId: Negotiate - opportunities.count_new_business},
          {id: Qualify - opportunities.count_new_business, name: Qualify, axisId: Qualify
              - opportunities.count_new_business}, {id: Qualify Renewal - opportunities.count_new_business,
            name: Qualify Renewal, axisId: Qualify Renewal - opportunities.count_new_business},
          {id: Validate - opportunities.count_new_business, name: Validate, axisId: Validate
              - opportunities.count_new_business}], showLabels: false, showValues: false,
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
  - title: Won vs Lost vs Created Opportunities - Week Cohort
    name: Won vs Lost vs Created Opportunities - Week Cohort
    model: salesforce
    explore: opportunities
    type: looker_line
    fields: [opportunities.created_week, opportunities.count, won_opportunities, lost_opportunities]
    fill_fields: [opportunities.created_week]
    filters:
      opportunity_owner.name: ''
      opportunity_owner.manager: ''
      opportunities.is_deleted: 'No'
      opportunities.created_week: 8 weeks
    sorts: [opportunities.created_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      label: Won Opportunities
      based_on: opportunities.count
      _kind_hint: measure
      measure: won_opportunities
      type: count_distinct
      _type_hint: number
      filters:
        opportunities.stage_name: First Campaign Published
    - category: measure
      label: Lost Opportunities
      based_on: opportunities.count
      _kind_hint: measure
      measure: lost_opportunities
      type: count_distinct
      _type_hint: number
      filters:
        opportunities.stage_name: Close Lost
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
        __FILE: salesforce/dashboards/pipeline_overview.dashboard.lookml
        __LINE_NUM: 427
    y_axes: [{label: '', orientation: left, series: [{id: opportunities.days_open, name: Opportunity
              Days Open, axisId: opportunities.days_open, __FILE: salesforce/dashboards/pipeline_overview.dashboard.lookml,
            __LINE_NUM: 431}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, type: linear, __FILE: salesforce/dashboards/pipeline_overview.dashboard.lookml,
        __LINE_NUM: 431}]
    size_by_field: opportunities.amount
    hide_legend: false
    series_colors:
      opportunities.days_open: "#EE9093"
    x_axis_datetime_label: ''
    hidden_fields:
    defaults_version:
    row: 3
    col: 0
    width: 24
    height: 8
