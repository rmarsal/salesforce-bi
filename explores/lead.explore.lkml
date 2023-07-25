include: "/views/*.view"

explore: leads {
  view_name: leads
  #  fields: [ALL_FIELDS*,-opportunities.opportunity_exclusion_set*, -account.account_exclusion_set*, -quota.quota_exclusion_set*]
  fields: [ALL_FIELDS*,-opportunities.opportunity_exclusion_set*]
  sql_always_where: NOT ${leads.is_deleted}
    ;;

  join: lead_owner {
    from: users
    sql_on: ${leads.owner_id} = ${lead_owner.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    sql_on: ${leads.converted_account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_owner {
    from: users
    sql_on: ${accounts.owner_id} = ${account_owner.id} ;;
    relationship: many_to_one
  }

  join: contacts {
    sql_on: ${leads.converted_contact_id} = ${contacts.id} ;;
    relationship: many_to_one
  }

  join: opportunities {
    sql_on: ${leads.converted_opportunity_id} = ${opportunities.id} ;;
    relationship: many_to_one
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

  join: tasks {
    sql_on: ${tasks.who_id} = ${leads.id} ;;
    relationship: one_to_many
  }
}
