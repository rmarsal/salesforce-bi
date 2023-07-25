include: "/views/*.view"

explore: contacts {
  view_name: contacts
  sql_always_where: NOT ${contacts.is_deleted} ;;

  # fields: [ALL_FIELDS*, -contact_owner.user_exclusion_set*, -opportunities.opportunity_exclusion_set*, -accounts.account_exclusion_set*, -quota.quota_exclusion_set*]
  fields: [ALL_FIELDS*, -opportunities.opportunity_exclusion_set*]

  join: contact_owner {
    from: users
    sql_on: ${contact_owner.id} = ${contacts.owner_id} ;;
    relationship: many_to_one
  }

  join: accounts {
    sql_on: ${contacts.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: opportunities {
    sql_on: ${accounts.id} = ${opportunities.account_id} ;;
    relationship: one_to_many
  }

  join: opportunity_owner {
    from: users
    sql_on: ${opportunities.owner_id} = ${opportunity_owner.id} ;;
    relationship: many_to_one
  }

  join: manager {
    from: users
    sql_on: ${opportunity_owner.manager_id} = ${manager.id};;
    fields: []
    relationship: many_to_one
  }
#
#   join: quota {
#     view_label: "Quota"
#     sql_on: ${quota.name} = ${opportunity_owner.name} ;;
#     relationship: one_to_one
#   }
#
#   join: aggregate_quota {
#     sql_on: ${aggregate_quota.quota_start_fiscal_quarter} = ${opportunities.close_fiscal_quarter}  ;;
#     relationship: many_to_one
#   }

#   join: quota_aggregation {
#     view_label: "Quota"
#     sql_on: ${quota_aggregation.ae_segment} = ${quota.ae_segment} ;;
#     relationship: one_to_one
#   }
#   join: first_meeting {
#     view_label: "Opportunity"
#     sql_on: ${opportunities.id} = ${first_meeting.opportunity_id} ;;
#     relationship: one_to_one
#   }
}
