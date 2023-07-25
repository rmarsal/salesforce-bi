# The name of this view in Looker is "Partnerships View"
view: partnerships {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `vibe-segment-io.prod_salesforce.partnerships_view` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Account C" in Explore.

  dimension: account_c {
    type: string
    sql: ${TABLE}.account_c ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: booked_ppdc_stage_change_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.booked_ppdc_stage_change_date_c ;;
  }

  dimension_group: booked_ppoc_stage_change_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.booked_ppoc_stage_change_date_c ;;
  }

  dimension: clients_typology_c {
    type: string
    sql: ${TABLE}.clients_typology_c ;;
  }

  dimension: contact_email_c {
    type: string
    sql: ${TABLE}.contact_email_c ;;
  }

  dimension: contact_name_c {
    type: string
    sql: ${TABLE}.contact_name_c ;;
  }

  dimension_group: contacted_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.contacted_date_c ;;
  }

  dimension: contacted_note_c {
    type: string
    sql: ${TABLE}.contacted_note_c ;;
  }

  dimension: contract_sent_c {
    type: yesno
    sql: ${TABLE}.contract_sent_c ;;
  }

  dimension_group: contract_signature_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.contract_signature_date_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_date ;;
  }

  dimension: declared_monthly_ad_spend_c {
    type: string
    sql: ${TABLE}.declared_monthly_ad_spend_c ;;
  }

  dimension_group: discovered_stage_change_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.discovered_stage_change_date_c ;;
  }

  dimension: first_campaign_advertiser_c {
    type: string
    sql: ${TABLE}.first_campaign_advertiser_c ;;
  }

  dimension: first_campaign_brief_c {
    type: string
    sql: ${TABLE}.first_campaign_brief_c ;;
  }

  dimension: first_campaign_budget_c {
    type: string
    sql: ${TABLE}.first_campaign_budget_c ;;
  }

  dimension: first_campaign_c {
    type: string
    sql: ${TABLE}.first_campaign_c ;;
  }

  dimension_group: first_campaign_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_campaign_date_c ;;
  }

  dimension: first_campaign_draft_c {
    type: string
    sql: ${TABLE}.first_campaign_draft_c ;;
  }

  dimension: first_campaign_kpi_c {
    type: string
    sql: ${TABLE}.first_campaign_kpi_c ;;
  }

  dimension: first_campaign_next_steps_c {
    type: string
    sql: ${TABLE}.first_campaign_next_steps_c ;;
  }

  dimension: first_campaign_s_details_c {
    type: string
    sql: ${TABLE}.first_campaign_s_details_c ;;
  }

  dimension: intro_to_ppam_done_c {
    type: yesno
    sql: ${TABLE}.intro_to_ppam_done_c ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_in_error_c {
    type: yesno
    sql: ${TABLE}.is_in_error_c ;;
  }

  dimension_group: last_activity {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: last_referenced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension_group: launched_campaign_stage_change_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.launched_campaign_stage_change_date_c ;;
  }

  dimension_group: loaded {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.loaded_at ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_clients_c {
    type: number
    sql: ${TABLE}.number_of_clients_c ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number_of_clients_c {
    type: sum
    sql: ${number_of_clients_c} ;;  }
  measure: average_number_of_clients_c {
    type: average
    sql: ${number_of_clients_c} ;;  }

  dimension_group: onboarded_stage_change_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.onboarded_stage_change_date_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: ppam_c {
    type: string
    sql: ${TABLE}.ppam_c ;;
  }

  dimension: ppdc_booked_week_c {
    type: string
    sql: ${TABLE}.ppdc_booked_week_c ;;
  }

  dimension_group: ppdc_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ppdc_date_c ;;
  }

  dimension: ppe_c {
    type: string
    sql: ${TABLE}.ppe_c ;;
  }

  dimension_group: ppoc_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.ppoc_date_c ;;
  }

  dimension: ppsdr_c {
    type: string
    sql: ${TABLE}.ppsdr_c ;;
  }

  dimension_group: received {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.received_at ;;
  }

  dimension_group: signed_contract_stage_change_date_c {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.signed_contract_stage_change_date_c ;;
  }

  dimension: signed_contract_url_c {
    type: string
    sql: ${TABLE}.signed_contract_url_c ;;
  }

  dimension: stage_c {
    type: string
    sql: ${TABLE}.stage_c ;;
  }

  dimension_group: system_modstamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension_group: uuid_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.uuid_ts ;;
  }

  dimension: website_c {
    type: string
    sql: ${TABLE}.website_c ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
