/**
 * Copyright (c) 2021 Gitpod GmbH. All rights reserved.
 * Licensed under the MIT License. See License-MIT.txt in the project root for license information.
 */

{
  prometheusRules+:: {
    groups+: [
      {
        name: 'gitpod-workspace-regular-not-active-slo-records',
        rules: [
          {
            record: 'gitpod_workspace_regular_not_active:5m_ratio',
            expr: |||
              avg_over_time((
                sum(gitpod_ws_manager_workspace_activity_total{active="false"})
                /
                sum(gitpod_ws_manager_workspace_phase_total{phase="RUNNING", type="REGULAR"})
              )[5m])
            |||,
          },
          {
            record: 'gitpod_workspace_regular_not_active:30mratio',
            expr: |||
              avg_over_time((
                sum(gitpod_ws_manager_workspace_activity_total{active="false"})
                /
                sum(gitpod_ws_manager_workspace_phase_total{phase="RUNNING", type="REGULAR"})
              )[30m])
            |||,
          },
          {
            record: 'gitpod_workspace_regular_not_active:1h_ratio',
            expr: |||
              avg_over_time((
                sum(gitpod_ws_manager_workspace_activity_total{active="false"})
                /
                sum(gitpod_ws_manager_workspace_phase_total{phase="RUNNING", type="REGULAR"})
              )[1h])
            |||,
          },
          {
            record: 'gitpod_workspace_regular_not_active:2h_ratio',
            expr: |||
              avg_over_time((
                sum(gitpod_ws_manager_workspace_activity_total{active="false"})
                /
                sum(gitpod_ws_manager_workspace_phase_total{phase="RUNNING", type="REGULAR"})
              )[2h])
            |||,
          },
          {
            record: 'gitpod_workspace_regular_not_active:6h_ratio',
            expr: |||
              avg_over_time((
                sum(gitpod_ws_manager_workspace_activity_total{active="false"})
                /
                sum(gitpod_ws_manager_workspace_phase_total{phase="RUNNING", type="REGULAR"})
              )[6h])
            |||,
          },
          {
            record: 'gitpod_workspace_regular_not_active:1d_ratio',
            expr: |||
              avg_over_time((
                sum(gitpod_ws_manager_workspace_activity_total{active="false"})
                /
                sum(gitpod_ws_manager_workspace_phase_total{phase="RUNNING", type="REGULAR"})
              )[1d])
            |||,
          },
          {
            record: 'gitpod_workspace_regular_not_active:3d_ratio',
            expr: |||
              avg_over_time((
                sum(gitpod_ws_manager_workspace_activity_total{active="false"})
                /
                sum(gitpod_ws_manager_workspace_phase_total{phase="RUNNING", type="REGULAR"})
              )[3d])
            |||,
          },
          {
            record: 'gitpod_workspace_regular_not_active:30d_ratio',
            expr: |||
              avg_over_time((
                sum(gitpod_ws_manager_workspace_activity_total{active="false"})
                /
                sum(gitpod_ws_manager_workspace_phase_total{phase="RUNNING", type="REGULAR"})
              )[30d])
            |||,
          },
          {
            record: 'gitpod_workspace_regular_not_active:slo_target',
            expr: '0.90',
          },
          {
            record: 'gitpod_workspace_regular_not_active:error_budget_remaining',
            expr: 'gitpod_workspace_regular_not_active:monthly_availability - gitpod_workspace_regular_not_active:slo_target',
          },
          {
            record: 'gitpod_workspace_regular_not_active:monthly_availability',
            expr: '1 - gitpod_workspace_regular_not_active:30d_ratio',
          },
        ],
      },
    ],
  },
}
