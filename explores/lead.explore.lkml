include: "/views/*.view"

explore: lead {
  view_name: lead
  #  fields: [ALL_FIELDS*,-opportunity.opportunity_exclusion_set*, -account.account_exclusion_set*, -quota.quota_exclusion_set*]
  fields: [ALL_FIELDS*,-opportunity.opportunity_exclusion_set*]
  sql_always_where: NOT ${lead.is_deleted}
    ;;

  join: lead_owner {
    from: user
    sql_on: ${lead.owner_id} = ${lead_owner.id} ;;
    relationship: many_to_one
  }

  join: account {
    sql_on: ${lead.converted_account_id} = ${account.id} ;;
    relationship: many_to_one
  }

  join: account_owner {
    from: user
    sql_on: ${account.owner_id} = ${account_owner.id} ;;
    relationship: many_to_one
  }

  join: contact {
    sql_on: ${lead.converted_contact_id} = ${contact.id} ;;
    relationship: many_to_one
  }

  join: opportunity {
    sql_on: ${lead.converted_opportunity_id} = ${opportunity.id} ;;
    relationship: many_to_one
  }

  join: opportunity_owner {
    from: user
    sql_on: ${opportunity.owner_id} = ${opportunity_owner.id} ;;
    relationship: many_to_one
  }

  join: manager {
    from: user
    sql_on: ${opportunity_owner.manager_id} = ${manager.id};;
    fields: []
    relationship: many_to_one
  }

  join: task {
    sql_on: ${task.who_id} = ${lead.id} ;;
    relationship: one_to_many
  }
}
