view: owner_opp_sorted {
  derived_table: {
    explore_source: opportunity {
      column: name { field: opportunity_owner.name }
      column: total_amount {}
      sort: {
        desc: yes
        field: total_amount
      }
      bind_all_filters: yes
    }
  }
  dimension: name {
    label: "Sorted Name"
    description: "Opportunity Owner (Sorted by total opportunity amount)"
    order_by_field: total_amount
  }
  dimension: total_amount {
    hidden: yes
    type: number
  }
}
