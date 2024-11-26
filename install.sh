#!/bin/sh
# https://github.com/dxlr8r/kubefs
BINDIR=${BINDIR:-"$HOME/.local/bin"}
mkdir -p "$BINDIR"
printf '%s\n' 'IyEvYmluL3NoCiMgaHR0cHM6Ly9naXRodWIuY29tL2R4bHI4ci9rdWJlZnMKaWYgXAp0ZXN0ICIke0tVQkVGU19DT01QTEVUSU9OOi10cnVlfSIgPSAndHJ1ZScgXAomJiB0ZXN0IC10IDEgXAomJiBjb21tYW5kIC12IF9nZXRfY29tcF93b3Jkc19ieV9yZWYgPi9kZXYvbnVsbCAyPiYxOyB0aGVuCmV2YWwgIiQocHJpbnRmICclc1xuJyBYMnQxWW1WbWMxOWpiMjF3YkdWMGFXOXVjMTltYVd4MFpYSW9LU0I3Q214dlkyRnNJSGR2Y21SelBTSWtNU0lLYkc5allXd2dZM1Z5UFNSN1EwOU5VRjlYVDFKRVUxdERUMDFRWDBOWFQxSkVYWDBLYkc5allXd2djbVZ6ZFd4MFBTZ3BDbWxtSUZ0YklDSWtlMk4xY2pvd09qRjlJaUE5UFNBaUxTSWdYVjA3SUhSb1pXNEtaV05vYnlBaUpIZHZjbVJ6SWdwbGJITmxDbVp2Y2lCM2IzSmtJR2x1SUNSM2IzSmtjenNnWkc4S1cxc2dJaVI3ZDI5eVpEb3dPakY5SWlBaFBTQWlMU0lnWFYwZ0ppWWdjbVZ6ZFd4MEt6MG9JaVIzYjNKa0lpa0taRzl1WlFwbFkyaHZJQ0lrZTNKbGMzVnNkRnNxWFgwaUNtWnBDbjBLWDJ0MVltVm1jMTlqYjIxd2JHVjBhVzl1Y3lncElIc0tiRzlqWVd3Z1kzVnlQU1I3UTA5TlVGOVhUMUpFVTF0RFQwMVFYME5YVDFKRVhYMEtiRzlqWVd3Z1kyOXRjSGR2Y21SelBTZ2lKSHREVDAxUVgxZFBVa1JUVzBCZE9qRTZKRU5QVFZCZlExZFBVa1F0TVgwaUtRcHNiMk5oYkNCamIyMXdiR2x1WlQwaUpIdGpiMjF3ZDI5eVpITmJLbDE5SWdwallYTmxJQ0lrWTI5dGNHeHBibVVpSUdsdUNpZHNiMk5ySUhObGMzTnBiMjRnZEc5bloyeGxKeW9wQ25kb2FXeGxJSEpsWVdRZ0xYSTdJR1J2SUVOUFRWQlNSVkJNV1NzOUtDSWtVa1ZRVEZraUtUc2daRzl1WlNBOElEd29ZMjl0Y0dkbGJpQXRWeUFpSkNoZmEzVmlaV1p6WDJOdmJYQnNaWFJwYjI1elgyWnBiSFJsY2lBaUpDaG1hVzVrSUNJa2UwdFZRa1ZHVTE5U1QwOVVPaTBrU0U5TlJTOHVhM1ZpWlgwaUlDMTBlWEJsSUdZZ0xXNWhiV1VnSnk1cmRXSmxZMjl1Wm1sbkp5QXlQaTlrWlhZdmJuVnNiQ2tpS1NJZ0xTMGdJaVJqZFhJaUtRbzdPd29uYkc5amF5Qm5iRzlpWVd3Z2RHOW5aMnhsSnlvcENuZG9hV3hsSUhKbFlXUWdMWEk3SUdSdklFTlBUVkJTUlZCTVdTczlLQ0lrVWtWUVRGa2lLVHNnWkc5dVpTQThJRHdvWTI5dGNHZGxiaUF0VnlBaUpDaGZhM1ZpWldaelgyTnZiWEJzWlhScGIyNXpYMlpwYkhSbGNpQWlKQ2htYVc1a0lDSWtlMHRWUWtWR1UxOVNUMDlVT2kwa1NFOU5SUzh1YTNWaVpYMGlJQzEwZVhCbElHWWdMVzVoYldVZ0p5NXJkV0psWTI5dVptbG5KeUF5UGk5a1pYWXZiblZzYkNraUtTSWdMUzBnSWlSamRYSWlLUW83T3dvbmJHOWpheUJ6WlhOemFXOXVJR3hwYzNRbktpa0tkMmhwYkdVZ2NtVmhaQ0F0Y2pzZ1pHOGdRMDlOVUZKRlVFeFpLejBvSWlSU1JWQk1XU0lwT3lCa2IyNWxJRHdnUENoamIyMXdaMlZ1SUMxWElDSWtLRjlyZFdKbFpuTmZZMjl0Y0d4bGRHbHZibk5mWm1sc2RHVnlJQ0lpS1NJZ0xTMGdJaVJqZFhJaUtRbzdPd29uYkc5amF5Qm5iRzlpWVd3Z2JHbHpkQ2NxS1FwM2FHbHNaU0J5WldGa0lDMXlPeUJrYnlCRFQwMVFVa1ZRVEZrclBTZ2lKRkpGVUV4WklpazdJR1J2Ym1VZ1BDQThLR052YlhCblpXNGdMVmNnSWlRb1gydDFZbVZtYzE5amIyMXdiR1YwYVc5dWMxOW1hV3gwWlhJZ0lpSXBJaUF0TFNBaUpHTjFjaUlwQ2pzN0NpZHNiMk5ySUhObGMzTnBiMjRnYzJWMEp5b3BDbmRvYVd4bElISmxZV1FnTFhJN0lHUnZJRU5QVFZCU1JWQk1XU3M5S0NJa1VrVlFURmtpS1RzZ1pHOXVaU0E4SUR3b1kyOXRjR2RsYmlBdFZ5QWlKQ2hmYTNWaVpXWnpYMk52YlhCc1pYUnBiMjV6WDJacGJIUmxjaUFpSkNobWFXNWtJQ0lrZTB0VlFrVkdVMTlTVDA5VU9pMGtTRTlOUlM4dWEzVmlaWDBpSUMxMGVYQmxJR1lnTFc1aGJXVWdKeTVyZFdKbFkyOXVabWxuSnlBeVBpOWtaWFl2Ym5Wc2JDa2lLU0lnTFMwZ0lpUmpkWElpS1FvN093b25iRzlqYXlCelpYTnphVzl1SUdSbGJDY3FLUXAzYUdsc1pTQnlaV0ZrSUMxeU95QmtieUJEVDAxUVVrVlFURmtyUFNnaUpGSkZVRXhaSWlrN0lHUnZibVVnUENBOEtHTnZiWEJuWlc0Z0xWY2dJaVFvWDJ0MVltVm1jMTlqYjIxd2JHVjBhVzl1YzE5bWFXeDBaWElnSWlJcElpQXRMU0FpSkdOMWNpSXBDanM3Q2lkc2IyTnJJSE5sYzNOcGIyNGdaMlYwSnlvcENuZG9hV3hsSUhKbFlXUWdMWEk3SUdSdklFTlBUVkJTUlZCTVdTczlLQ0lrVWtWUVRGa2lLVHNnWkc5dVpTQThJRHdvWTI5dGNHZGxiaUF0VnlBaUpDaGZhM1ZpWldaelgyTnZiWEJzWlhScGIyNXpYMlpwYkhSbGNpQWlJaWtpSUMwdElDSWtZM1Z5SWlrS096c0tKMnh2WTJzZ1oyeHZZbUZzSUhObGRDY3FLUXAzYUdsc1pTQnlaV0ZrSUMxeU95QmtieUJEVDAxUVVrVlFURmtyUFNnaUpGSkZVRXhaSWlrN0lHUnZibVVnUENBOEtHTnZiWEJuWlc0Z0xWY2dJaVFvWDJ0MVltVm1jMTlqYjIxd2JHVjBhVzl1YzE5bWFXeDBaWElnSWlRb1ptbHVaQ0FpSkh0TFZVSkZSbE5mVWs5UFZEb3RKRWhQVFVVdkxtdDFZbVY5SWlBdGRIbHdaU0JtSUMxdVlXMWxJQ2N1YTNWaVpXTnZibVpwWnljZ01qNHZaR1YyTDI1MWJHd3BJaWtpSUMwdElDSWtZM1Z5SWlrS096c0tKMnh2WTJzZ1oyeHZZbUZzSUdSbGJDY3FLUXAzYUdsc1pTQnlaV0ZrSUMxeU95QmtieUJEVDAxUVVrVlFURmtyUFNnaUpGSkZVRXhaSWlrN0lHUnZibVVnUENBOEtHTnZiWEJuWlc0Z0xWY2dJaVFvWDJ0MVltVm1jMTlqYjIxd2JHVjBhVzl1YzE5bWFXeDBaWElnSWlJcElpQXRMU0FpSkdOMWNpSXBDanM3Q2lkc2IyTnJJR2RzYjJKaGJDQm5aWFFuS2lrS2QyaHBiR1VnY21WaFpDQXRjanNnWkc4Z1EwOU5VRkpGVUV4Wkt6MG9JaVJTUlZCTVdTSXBPeUJrYjI1bElEd2dQQ2hqYjIxd1oyVnVJQzFYSUNJa0tGOXJkV0psWm5OZlkyOXRjR3hsZEdsdmJuTmZabWxzZEdWeUlDSWlLU0lnTFMwZ0lpUmpkWElpS1FvN093b25iRzlqYXlCelpYTnphVzl1SnlvcENuZG9hV3hsSUhKbFlXUWdMWEk3SUdSdklFTlBUVkJTUlZCTVdTczlLQ0lrVWtWUVRGa2lLVHNnWkc5dVpTQThJRHdvWTI5dGNHZGxiaUF0VnlBaUpDaGZhM1ZpWldaelgyTnZiWEJzWlhScGIyNXpYMlpwYkhSbGNpQWljMlYwSUhSdloyZHNaU0JrWld3Z1oyVjBJR3hwYzNRaUtTSWdMUzBnSWlSamRYSWlLUW83T3dvbmJHOWpheUJuYkc5aVlXd25LaWtLZDJocGJHVWdjbVZoWkNBdGNqc2daRzhnUTA5TlVGSkZVRXhaS3owb0lpUlNSVkJNV1NJcE95QmtiMjVsSUR3Z1BDaGpiMjF3WjJWdUlDMVhJQ0lrS0Y5cmRXSmxabk5mWTI5dGNHeGxkR2x2Ym5OZlptbHNkR1Z5SUNKelpYUWdkRzluWjJ4bElHUmxiQ0JuWlhRZ2JHbHpkQ0lwSWlBdExTQWlKR04xY2lJcENqczdDaWRzYVhOMExXRnNiQ2NxS1FwM2FHbHNaU0J5WldGa0lDMXlPeUJrYnlCRFQwMVFVa1ZRVEZrclBTZ2lKRkpGVUV4WklpazdJR1J2Ym1VZ1BDQThLR052YlhCblpXNGdMVmNnSWlRb1gydDFZbVZtYzE5amIyMXdiR1YwYVc5dWMxOW1hV3gwWlhJZ0lpSXBJaUF0TFNBaUpHTjFjaUlwQ2pzN0NpZHNhWE4wSnlvcENuZG9hV3hsSUhKbFlXUWdMWEk3SUdSdklFTlBUVkJTUlZCTVdTczlLQ0lrVWtWUVRGa2lLVHNnWkc5dVpTQThJRHdvWTI5dGNHZGxiaUF0VnlBaUpDaGZhM1ZpWldaelgyTnZiWEJzWlhScGIyNXpYMlpwYkhSbGNpQWlJaWtpSUMwdElDSWtZM1Z5SWlrS096c0tKMkYxZEdnbktpa0tkMmhwYkdVZ2NtVmhaQ0F0Y2pzZ1pHOGdRMDlOVUZKRlVFeFpLejBvSWlSU1JWQk1XU0lwT3lCa2IyNWxJRHdnUENoamIyMXdaMlZ1SUMxWElDSWtLRjlyZFdKbFpuTmZZMjl0Y0d4bGRHbHZibk5mWm1sc2RHVnlJQ0lrS0dacGJtUWdJaVI3UzFWQ1JVWlRYMUpQVDFRNkxTUklUMDFGTHk1cmRXSmxmU0lnTFhSNWNHVWdaaUF0Ym1GdFpTQW5MbXQxWW1WaGRYUm9KeUF5UGk5a1pYWXZiblZzYkNraUtTSWdMUzBnSWlSamRYSWlLUW83T3dvbmJHOWpheWNxS1FwM2FHbHNaU0J5WldGa0lDMXlPeUJrYnlCRFQwMVFVa1ZRVEZrclBTZ2lKRkpGVUV4WklpazdJR1J2Ym1VZ1BDQThLR052YlhCblpXNGdMVmNnSWlRb1gydDFZbVZtYzE5amIyMXdiR1YwYVc5dWMxOW1hV3gwWlhJZ0ltZHNiMkpoYkNCelpYTnphVzl1SWlraUlDMHRJQ0lrWTNWeUlpa0tPenNLSjJkbGRDY3FLUXAzYUdsc1pTQnlaV0ZrSUMxeU95QmtieUJEVDAxUVVrVlFURmtyUFNnaUpGSkZVRXhaSWlrN0lHUnZibVVnUENBOEtHTnZiWEJuWlc0Z0xWY2dJaVFvWDJ0MVltVm1jMTlqYjIxd2JHVjBhVzl1YzE5bWFXeDBaWElnSWlJcElpQXRMU0FpSkdOMWNpSXBDanM3Q2lvcENuZG9hV3hsSUhKbFlXUWdMWEk3SUdSdklFTlBUVkJTUlZCTVdTczlLQ0lrVWtWUVRGa2lLVHNnWkc5dVpTQThJRHdvWTI5dGNHZGxiaUF0VnlBaUpDaGZhM1ZpWldaelgyTnZiWEJzWlhScGIyNXpYMlpwYkhSbGNpQWlaMlYwSUd4cGMzUWdiR2x6ZEMxaGJHd2dZWFYwYUNCc2IyTnJJaWtpSUMwdElDSWtZM1Z5SWlrS096c0taWE5oWXdwOUlDWW1DbU52YlhCc1pYUmxJQzFHSUY5cmRXSmxabk5mWTI5dGNHeGxkR2x2Ym5NZ2EzVmlaV1p6Q2c9PSB8IGJhc2U2NCAtLWRlY29kZSkiCmZpCl9rZnNfcHJpbnRmX3N0ZGVycigpIHsKaWYgdGVzdCAiJCMiIC1lcSAwOyB0aGVuCl9rZnNfcHJpbnRmX3N0ZGVyciAnJXNcbicgIiQoY2F0KSIKZWxzZQpwcmludGYgLS0gIiRAIiA+L2Rldi9zdGRlcnIKZmkKfQpfa2ZtX2lwcmludGYoKSB7CmlmIHRlc3QgLXQgMSB8fCB0ZXN0IC1uICIke0tVQkVGU19ERUJVRzotfSI7IHRoZW4KaWYgdGVzdCAiJCMiIC1lcSAwOyB0aGVuCmNhdCB8IF9rZnNfcHJpbnRmX3N0ZGVycgplbHNlCl9rZnNfcHJpbnRmX3N0ZGVyciAiJEAiCmZpCmZpCn0KX2tmc19kZWJ1ZygpIHsKaWYgdGVzdCAtbiAiJHtLVUJFRlNfREVCVUc6LX0iOyB0aGVuCmlmIHRlc3QgIiQjIiAtZXEgMDsgdGhlbgpjYXQgfCBfa2ZzX3ByaW50Zl9zdGRlcnIKZWxzZQpfa2ZzX3ByaW50Zl9zdGRlcnIgIiRAIgpmaQpmaQp9Cl9rZnNfcGFyZW50cygpICgKZGlybmFtZT0iJHsxOi0kKHB3ZCl9IgppZiB0ZXN0ICIkZGlybmFtZSIgIT0gJy8nOyB0aGVuCnByaW50ZiAnJXNcbicgIiRkaXJuYW1lIgpfa2ZzX3BhcmVudHMgIiQoZGlybmFtZSAiJGRpcm5hbWUiKSIKZWxzZQpwcmludGYgJy9cbicKcmV0dXJuIDAKZmkKKQpfa2ZzX2Rpcm5hbWUoKSAoCmlmIHRlc3QgLWQgIiR7MTotfSI7IHRoZW4KcHJpbnRmICclc1xuJyAiJDEiCmVsaWYgdGVzdCAtZSAiJHsxOi19IjsgdGhlbgpkaXJuYW1lICIkMSIKZWxzZQo6CmZpCikKX2tmc19yZXNvbHZlX3N5bWxpbmsoKSB7CmF3ayBcCi12IExJTks9IiQxIiBcCi12IExJU1Q9IiQoTENfQUxMPUMgY29tbWFuZCBscyAtbCAiJDEiKSIgXAonQkVHSU4gewpMSU5LX0xFTj1sZW5ndGgoTElOSykKTElOS19QT1M9aW5kZXgoTElTVCwgTElOSyk7CnByaW50IHN1YnN0cihMSVNULCBMSU5LX1BPUytMSU5LX0xFTis0KQp9Jwp9Cl9rZnNfZmluZF9rdWJlY29uZmlnKCkgKAppZiB0ZXN0IC1uICIke0xPQ0tfS1VCRUNPTkZJRzotfSI7IHRoZW4KY2FuZGlkYXRlPSIkTE9DS19LVUJFQ09ORklHIgplbHNlCmNhbmRpZGF0ZT0kKFwKX2tmc19wYXJlbnRzICIkezE6LX0iIFwKfCB4YXJncyAtSSB7fSBscyAtMSB7fS8ua3ViZWNvbmZpZyAyPi9kZXYvbnVsbCBcCnwgaGVhZCAtbjEgXAopCmZpCmt1YmVjb25maWc9JHtjYW5kaWRhdGU6LSRIT01FLy5rdWJlL2NvbmZpZ30KcHJpbnRmICclc1xuJyAiJGt1YmVjb25maWciCl9rZnNfZGVidWcgJyMgS1VCRUNPTkZJRz0iJXMiXG4nICIka3ViZWNvbmZpZyIKKQpfa2ZzX2xvY2tfc2Vzc2lvbl9zZXQoKSB7Cl9rZnNfZGlybmFtZT0kKF9rZnNfZGlybmFtZSAiJHsxOi19IikKZXhwb3J0IExPQ0tfS1VCRUNPTkZJRz0kKF9rZnNfZmluZF9rdWJlY29uZmlnICIkX2tmc19kaXJuYW1lIikKZXhwb3J0IEtVQkVDT05GSUc9IiRMT0NLX0tVQkVDT05GSUciCl9rZm1faXByaW50ZiAnIyBMT0NLX0tVQkVDT05GSUc9IiVzIlxuJyAiJExPQ0tfS1VCRUNPTkZJRyIKfQpfa2ZzX2xvY2tfc2Vzc2lvbl9kZWwoKSB7CnRlc3QgIiR7S1VCRUNPTkZJRzotfSIgPSAiJHtMT0NLX0tVQkVDT05GSUc6LX0iICYmIHVuc2V0IEtVQkVDT05GSUcgfHwgOgp1bnNldCBMT0NLX0tVQkVDT05GSUcKX2tmbV9pcHJpbnRmICcjIHVuc2V0IExPQ0tfS1VCRUNPTkZJR1xuJwp9Cl9rZnNfbG9ja19zZXNzaW9uX3RvZ2dsZSgpIHsKaWYgdGVzdCAteiAiJHsxOi19IiAtYSAtbiAiJExPQ0tfS1VCRUNPTkZJRyI7IHRoZW4KX2tmc19sb2NrX3Nlc3Npb25fZGVsCmVsc2UKX2tmc19sb2NrX3Nlc3Npb25fc2V0ICIkezE6LX0iCmZpCn0KX2tmc19sb2NrX3Nlc3Npb25fZ2V0KCkgKAppZiB0ZXN0IC1uICIkTE9DS19LVUJFQ09ORklHIjsgdGhlbgp0ZXN0ICIkezE6LX0iID0gImxpc3QiIFwKJiYgcHJpbnRmICdMT0NLX0tVQkVDT05GSUc9IiVzIlxuJyAiJChfa2ZzX2xvY2tfc2Vzc2lvbl9nZXQpIiBcCnx8IHByaW50ZiAnJXNcbicgIiRMT0NLX0tVQkVDT05GSUciCmZpCikKX2tmc19sb2NrX2dsb2JhbF9zZXQoKSAoCl9rZnNfZGlybmFtZT0kKF9rZnNfZGlybmFtZSAiJHsxOi19IikKa3ViZWNvbmZpZz0kKF9rZnNfZmluZF9rdWJlY29uZmlnICIkX2tmc19kaXJuYW1lIikKaWYgdGVzdCAiJGt1YmVjb25maWciID0gIiRIT01FLy5rdWJlL2NvbmZpZyI7IHRoZW4KX2tmc19wcmludGZfc3RkZXJyICcjIElORk86IG5vIGAua3ViZWNvbmZpZ2AgZm91bmQgaW4gZGlyZWN0b3J5IGAlc2AuXG4nICIkKHB3ZCkiCnJldHVybiAxCmVsc2UKdGVzdCAtTCAiJEhPTUUvLmt1YmUvY29uZmlnIiAmJiB1bmxpbmsgIiRIT01FLy5rdWJlL2NvbmZpZyIgfHwgOgppZiAhIHRlc3QgLWUgIiRIT01FLy5rdWJlL2NvbmZpZyI7IHRoZW4KbG4gLXMgIiRrdWJlY29uZmlnIiAiJEhPTUUvLmt1YmUvY29uZmlnIgpfa2ZtX2lwcmludGYgJyMgbG4gLXMgIiVzIiAiJXMiXG4nICIka3ViZWNvbmZpZyIgIiRIT01FLy5rdWJlL2NvbmZpZyIKZWxzZQpfa2ZzX3ByaW50Zl9zdGRlcnIgJyMgRVJST1I6IGAlc2Agbm90IGEgc3ltbGluay5cbicgIiRIT01FLy5rdWJlL2NvbmZpZyIKZmkKZmkKKQpfa2ZzX2xvY2tfZ2xvYmFsX2RlbCgpICgKaWYgdW5saW5rICIkSE9NRS8ua3ViZS9jb25maWciIDI+L2Rldi9udWxsOyB0aGVuCl9rZm1faXByaW50ZiAnIyB1bmxpbmsgIiVzIlxuJyAiJEhPTUUvLmt1YmUvY29uZmlnIgplbHNlCl9rZnNfcHJpbnRmX3N0ZGVyciAnIyBXQVJOSU5HOiBgJXNgIG5vdCBhIHN5bWxpbmsuXG4nICIkSE9NRS8ua3ViZS9jb25maWciCmZpCikKX2tmc19sb2NrX2dsb2JhbF90b2dnbGUoKSAoCmlmIHRlc3QgLXogIiR7MTotfSIgLWEgLUwgIiRIT01FLy5rdWJlL2NvbmZpZyI7IHRoZW4KX2tmc19sb2NrX2dsb2JhbF9kZWwKZWxzZQpfa2ZzX2xvY2tfZ2xvYmFsX3NldCAiJHsxOi19IgpmaQopCl9rZnNfbG9ja19nbG9iYWxfZ2V0KCkgKAppZiB0ZXN0IC1MICIkSE9NRS8ua3ViZS9jb25maWciOyB0aGVuCnRlc3QgIiR7MTotfSIgPSAibGlzdCIgJiYgcHJpbnRmICclcyAtPiAnICIkSE9NRS8ua3ViZS9jb25maWciIHx8IDoKcHJpbnRmICclc1xuJyAiJChfa2ZzX3Jlc29sdmVfc3ltbGluayAiJEhPTUUvLmt1YmUvY29uZmlnIikiCmZpCikKX2tmc19rdWJlYXV0aCgpICgKaWYgdGVzdCAtbiAiJHtMT0NLX0tVQkVDT05GSUc6LX0iOyB0aGVuCl9rZnNfcHJpbnRmX3N0ZGVyciAnIyBJTkZPOiBDYW4gbm90IGV4ZWN1dGUgYXV0aGVudGljYXRlIHdoaWxlIGBMT0NLX0tVQkVDT05GSUdgIGlzIHNldC5cbicKcmV0dXJuIDAKZmkKX2tmc19kaXJuYW1lPSQoX2tmc19kaXJuYW1lICIkezE6LX0iKQppZiBcCnNlYXJjaF9rdWJlYXV0aD0kKFwKX2tmc19wYXJlbnRzICIkX2tmc19kaXJuYW1lIiBcCnwgeGFyZ3MgLUkge30gbHMgLTEge30vLmt1YmVhdXRoIDI+L2Rldi9udWxsIFwKfCBoZWFkIC1uMSBcCik7CnRlc3QgLW4gIiRzZWFyY2hfa3ViZWF1dGgiOyB0aGVuCmt1YmVhdXRoPSIkc2VhcmNoX2t1YmVhdXRoIgplbHNlCl9rZnNfcHJpbnRmX3N0ZGVyciAiIyBXQVJOSU5HOiBDb3VsZCBub3QgZmluZCBhbnkgXGAua3ViZWF1dGhcYCBpbiBwYXRoIG9yIHBhcmVudHMnIHBhdGhzXG4iCnJldHVybiAxCmZpCnRlc3QgLXggIiRrdWJlYXV0aCIgfHwgY2htb2QgK3ggIiRrdWJlYXV0aCIKX2tmc19kZWJ1ZyAnIyBrdWJlYXV0aD0iJXMiXG4nICIka3ViZWF1dGgiCmV4cG9ydCBLVUJFQ09ORklHPSQoX2tmc19maW5kX2t1YmVjb25maWcgIiRfa2ZzX2Rpcm5hbWUiKQoiJGt1YmVhdXRoIgopCl9rZnNfa3ViZWN0bCgpICgKZXhwb3J0IEtVQkVDT05GSUc9JChfa2ZzX2ZpbmRfa3ViZWNvbmZpZykKY29tbWFuZCBrdWJlY3RsICIkQCIKKQprdWJlZnMoKSB7CmNhc2UgJHsxOi1nZXR9IGluCmN0bHxrdWJlY3RsKQpzaGlmdApfa2ZzX2t1YmVjdGwgIiRAIgo7OwpnfGdldCkKcHJpbnRmICclc1xuJyAiJChfa2ZzX2ZpbmRfa3ViZWNvbmZpZykiCjs7CmxzfGxpc3QpCnByaW50ZiAnS1VCRUNPTkZJRz0iJXMiXG4nICIkKGt1YmVmcyBnZXQpIgo7OwpsYXxsc2F8bGlzdC1hbGwpCmt1YmVmcyBsaXN0Cmt1YmVmcyBsb2NrIHNlc3Npb24gbGlzdAprdWJlZnMgbG9jayBnbG9iYWwgbGlzdAo7OwphdXRofGF1dGhlbnRpY2F0ZSkKX2tmc19rdWJlYXV0aCAiJHsyOi19Igo7Owpsb2NrKQpjYXNlICR7Mjotc2Vzc2lvbn0gaW4KZ2xvYmFsKQpjYXNlICR7Mzotc2V0fSBpbgpkZWx8ZGVsZXRlfHJtfHJlbW92ZXx1bnNldCkKX2tmc19sb2NrX2dsb2JhbF9kZWwKOzsKdG9nZ2xlKQpfa2ZzX2xvY2tfZ2xvYmFsX3RvZ2dsZSAiJHs0Oi19Igo7OwpnfGdldCkKX2tmc19sb2NrX2dsb2JhbF9nZXQgZ2V0Cjs7CmxzfGxpc3QpCl9rZnNfbG9ja19nbG9iYWxfZ2V0IGxpc3QKOzsKc2V0fGFkZHxtaykKX2tmc19sb2NrX2dsb2JhbF9zZXQgIiR7NDotfSIKOzsKaGVscHwqKQo6Cjs7CmVzYWMKOzsKc2Vzc2lvbikKY2FzZSAkezM6LXNldH0gaW4KZGVsfGRlbGV0ZXxybXxyZW1vdmV8dW5zZXQpCl9rZnNfbG9ja19zZXNzaW9uX2RlbAo7Owp0b2dnbGUpCl9rZnNfbG9ja19zZXNzaW9uX3RvZ2dsZSAiJHs0Oi19Igo7OwpnfGdldCkKX2tmc19sb2NrX3Nlc3Npb25fZ2V0IGdldAo7Owpsc3xsaXN0KQpfa2ZzX2xvY2tfc2Vzc2lvbl9nZXQgbGlzdAo7OwpzZXR8YWRkfG1rKQpfa2ZzX2xvY2tfc2Vzc2lvbl9zZXQgIiR7NDotfSIKOzsKaGVscHwqKQo6Cjs7CmVzYWMKOzsKaGVscHwqKQo6Cjs7CmVzYWMKOzsKaGVscHwqKQo6Cjs7CmVzYWMKfQppZiB0ZXN0ICIkeyM6LTB9IiAtZ3QgMDsgdGhlbgprdWJlZnMgIiRAIgplbGlmICEgdGVzdCAtdCAxOyB0aGVuCmt1YmVmcyBnZXQKZWxzZQp1bnNldCBLVUJFQ09ORklHIExPQ0tfS1VCRUNPTkZJRwpmaQpfa2ZzX3doaWNoKCkgewp3aGlsZSB0ZXN0ICIkIyIgLWd0IDA7IGRvCmNvbW1hbmQgLXYgIiQxIiA+L2Rldi9udWxsIDI+JjEgfHwgcmV0dXJuICQ/CnNoaWZ0CmRvbmUKfQpfa2ZzX2FsaWFzKCkgewphbGlhcyAkMT0iJDIiCl9rZnNfd2hpY2ggX2t1YmVmc19jb21wbGV0aW9ucyB8fCByZXR1cm4gMApldmFsICIkKHByaW50ZiAiCl9rdWJlZnNfY29tcGxldGlvbnNfJDEoKSB7CmxvY2FsIGNvbXBsCmNvbXBsPVwke0NPTVBfV09SRFNbQF06MX0KKCggQ09NUF9DV09SRCArPSAyICkpCkNPTVBfV09SRFM9KCBrdWJlY3RsICckMicgXCJcJHtjb21wbDotIH1cIiApCl9rdWJlZnNfY29tcGxldGlvbnMKfQpjb21wbGV0ZSAtbyBkZWZhdWx0IC1GIF9rdWJlZnNfY29tcGxldGlvbnNfJDEgJDEKIikiCn0KYWxpYXMga3ViZWN0bD0nX2tmc19rdWJlY3RsJwppZiB0ZXN0ICIke0tVQkVGU19SRUNPTU1FTkRFRF9BTElBUzotdHJ1ZX0iID0gJ3RydWUnOyB0aGVuCmFsaWFzIGtmPSdrdWJlZnMnCl9rZnNfd2hpY2ggX2t1YmVmc19jb21wbGV0aW9ucyAmJiBjb21wbGV0ZSAtRiBfa3ViZWZzX2NvbXBsZXRpb25zIGtmIHx8IDoKZmkKaWYgdGVzdCAiJHtLVUJFRlNfT1BUSU9OQUxfQUxJQVM6LXRydWV9IiA9ICd0cnVlJzsgdGhlbgpfa2ZzX2FsaWFzIGtmZyAnbG9jayBnbG9iYWwgdG9nZ2xlJwpfa2ZzX2FsaWFzIGtmZSAnbG9jayBzZXNzaW9uIHNldCcKX2tmc19hbGlhcyBrZmwgJ2xvY2sgc2Vzc2lvbiB0b2dnbGUnCmFsaWFzIGtmbHM9J2t1YmVmcyBsaXN0LWFsbCcKYWxpYXMga2ZhPSdrdWJlZnMgYXV0aCcKZm9yIHRvb2wgaW4gJChwcmludGYgJyVzXG4nICR7S1VCRUZTX1RPT0w6LWhlbG19IHwgdHIgJzonICcgJyk7IGRvCmNvbW1hbmQgLXYgJHRvb2wgPi9kZXYvbnVsbCAyPiYxIFwKJiYgYWxpYXMgJHRvb2w9IktVQkVDT05GSUc9XCQoa2YpIGNvbW1hbmQgJHRvb2wiIHx8IGNvbnRpbnVlCmRvbmUKZmkK' | base64 --decode > "$BINDIR/kubefs"
chmod +x "$BINDIR/kubefs"
printf '%s\n' 'IyEvYmluL3NoCiMgaHR0cHM6Ly9naXRodWIuY29tL2R4bHI4ci9rdWJlZnMKIyBoYXZpbmcgYC5rdWJlbG9naW5gIGFuZCBgLmt1YmVjb25maWdgIGluIHRoZSBzYW1lIGRpcmVjdG9yeSBpcyBhIGdvb2QgcHJhY3RpY2UuIEJ1dCBub3QgcmVxdWlyZWQgYnkga3ViZWZzLgoKRU1QVFlfS1VCRUNPTkZJRz0nYXBpVmVyc2lvbjogdjEKa2luZDogQ29uZmlnCmNsdXN0ZXJzOiBbXQpjb250ZXh0czogW10KY3VycmVudC1jb250ZXh0OiAiIgp1c2VyczogW10nCgpTUEFUSD0kKENEUEFUSD0gY2QgLS0gIiQoZGlybmFtZSAtLSAiJDAiKSIgJiYgcHdkKQojIGNoZWNrIGlmIC5rdWJlY29uZmlnIGV4aXN0IGluIHRoZSBzYW1lIGRpcmVjdG9yeSBhcyBrdWJlbG9naW5faW5pdCBpcyBjYWxsZWQvc291cmNlZAppZiAhIHRlc3QgLWYgIiR7U1BBVEh9Ly5rdWJlY29uZmlnIjsgdGhlbgogIHByaW50ZiAnJXNcbicgIiRFTVBUWV9LVUJFQ09ORklHIiA+ICIke1NQQVRIfS8ua3ViZWNvbmZpZyIKICBjaG1vZCA2MDAgIiR7U1BBVEh9Ly5rdWJlY29uZmlnIgpmaQpleHBvcnQgS1VCRUNPTkZJRz0iJHtTUEFUSH0vLmt1YmVjb25maWciCgprdWJlY3RsIGF1dGggY2FuLWkgLS1saXN0ID4vZGV2L251bGwgMj4mMSBcCiYmIEtVQkVfQVVUSEVOVElDQVRFRD10cnVlIFwKfHwgdW5zZXQgS1VCRV9BVVRIRU5USUNBVEVECg==' | base64 --decode > "$BINDIR/kubeauth_init"
chmod +x "$BINDIR/kubeauth_init"
printf '%s\n' 'IyEvYmluL3NoCiMgaHR0cHM6Ly9naXRodWIuY29tL2R4bHI4ci9rdWJlZnMKX2tmc19hZGRvbnNfa3ViZWN0bF9hbGlhc19jb21wbGV0ZSgpIHsKdGVzdCAiJHtLVUJFRlNfQ09NUExFVElPTjotdHJ1ZX0iID0gJ3RydWUnIHx8IHJldHVybiAwCnRlc3QgLXQgMSB8fCByZXR1cm4gMApjb21tYW5kIC12IF9nZXRfY29tcF93b3Jkc19ieV9yZWYgPi9kZXYvbnVsbCAyPiYxIHx8IHJldHVybiAwCmNvbW1hbmQgLXYgX19zdGFydF9rdWJlY3RsID4vZGV2L251bGwgMj4mMSB8fCByZXR1cm4gMApldmFsICIkKHByaW50ZiAiCl9rdWJlY3RsX2NvbXBsZXRpb25zXyQxKCkgewpsb2NhbCBjb21wbApjb21wbD1cJHtDT01QX1dPUkRTW0BdOjF9CigoIENPTVBfQ1dPUkQgKz0gMiApKQpDT01QX1dPUkRTPSgga3ViZWN0bCAkMiBcIlwke2NvbXBsOi0gfVwiICkKX19zdGFydF9rdWJlY3RsCn0KY29tcGxldGUgLW8gZGVmYXVsdCAtRiBfa3ViZWN0bF9jb21wbGV0aW9uc18kMSAkMQoiKSIKfQpfa2ZzX2FkZG9uc19rdWJlY3RsX2FsaWFzX2NvbXBsZXRlIGt4ICdjb25maWcgdXNlLWNvbnRleHQnCmt4KCkgKAppZiBjb21tYW5kIC12IGt1YmVmcyA+L2Rldi9udWxsIDI+JjE7IHRoZW4KZXhwb3J0IEtVQkVDT05GSUc9JChrdWJlZnMpCmZpCmlmIHRlc3QgIiQxIjsgdGhlbgprdWJlY3RsIGNvbmZpZyB1c2UtY29udGV4dCAiJDEiCmVsc2UKX3JjdHg9JChrdWJlY3RsIGNvbmZpZyBnZXQtY29udGV4dHMpCl9oZWFkZXI9JChwcmludGYgJyVzXG4nICIkX3JjdHgiIHwgaGVhZCAtbjEpCl9tYXhfbGVuPSQocHJpbnRmICclc1xuJyAiJF9yY3R4IiB8IGF3ayAne3ByaW50IGxlbmd0aH0nIHwgc29ydCAtcm4gfCBoZWFkIC1uMSkKX3NlcD0kJ1x0JwpfY29sdW1ucz0ke0tYX0NPTFVNTlM6LSdOQU1FLE5BTUVTUEFDRSxDTFVTVEVSLENVUlJFTlQnfQpfY3R4PSQocHJpbnRmICclc1xuJyAiJF9yY3R4IiBcCnwgYXdrIC12IFNFUD0iJF9zZXAiIC12IENPTFVNTlM9IiRfY29sdW1ucyIgXAotdiBIRUFEPSIkX2hlYWRlciIgLXYgTUFYTEVOPSIkX21heF9sZW4iIFwKJ0JFR0lOIHsKc3BsaXQoQ09MVU1OUywgVENPTCwgIiwiKQpUQ09MX0xFTj0wOyBmb3IoQ09MIGluIFRDT0wpeyBUQ09MX0xFTisrIH0KR0FQPTM7CkNVUlJFTlRfU1RBUlQ9MDsKQ1VSUkVOVF9MRU49aW5kZXgoSEVBRCwgIk5BTUUiKS0xOwpOQU1FX1NUQVJUPUNVUlJFTlRfTEVOKzE7Ck5BTUVfTEVOPWluZGV4KEhFQUQsICJDTFVTVEVSIiktTkFNRV9TVEFSVDsKQ0xVU1RFUl9TVEFSVD1OQU1FX1NUQVJUK05BTUVfTEVOCkNMVVNURVJfTEVOPWluZGV4KEhFQUQsICJBVVRISU5GTyIpLUNMVVNURVJfU1RBUlQ7CkFVVEhJTkZPX1NUQVJUPUNMVVNURVJfU1RBUlQrQ0xVU1RFUl9MRU4KQVVUSElORk9fTEVOPWluZGV4KEhFQUQsICJOQU1FU1BBQ0UiKS1BVVRISU5GT19TVEFSVDsKTkFNRVNQQUNFX1NUQVJUPUFVVEhJTkZPX1NUQVJUK0FVVEhJTkZPX0xFTgpOQU1FU1BBQ0VfTEVOPU1BWExFTi1OQU1FU1BBQ0VfU1RBUlQ7Cn0KewpEQ09MWyJDVVJSRU5UIl09c3Vic3RyKCQwLCBDVVJSRU5UX1NUQVJULCBDVVJSRU5UX0xFTi1HQVApOwpEQ09MWyJOQU1FIl09c3Vic3RyKCQwLCBOQU1FX1NUQVJULCBOQU1FX0xFTi1HQVApOwpEQ09MWyJDTFVTVEVSIl09c3Vic3RyKCQwLCBDTFVTVEVSX1NUQVJULCBDTFVTVEVSX0xFTi1HQVApOwpEQ09MWyJBVVRISU5GTyJdPXN1YnN0cigkMCwgQVVUSElORk9fU1RBUlQsIEFVVEhJTkZPX0xFTi1HQVApOwpfTkFNRVNQQUNFPXN1YnN0cigkMCwgTkFNRVNQQUNFX1NUQVJUKTsKZm9yIChpID0gMDsgaSA8PSAoTUFYTEVOLWxlbmd0aCgkMCktMSk7IGkrKykgeyBfTkFNRVNQQUNFPV9OQU1FU1BBQ0UgIiAiIH0KRENPTFsiTkFNRVNQQUNFIl09X05BTUVTUEFDRQpmb3IoaT0xOyBpIDw9IFRDT0xfTEVOOyBpKyspIHsKcHJpbnRmICIlcyIsIERDT0xbVENPTFtpXV0KaWYoaSA8IFRDT0xfTEVOKSB7IHByaW50ZiAiJXMiLCBTRVAgfQp9CnByaW50ZiAiXG4iCn0nKQpfY3VycmVudF9jb2w9JChcCnByaW50ZiAnJXMnICIkX2NvbHVtbnMiIFwKfCB0ciAsICdcbidcCnwgYXdrICd7aWYoJDEgPT0gIkNVUlJFTlQiKSB7cHJpbnQgTlJ9IH0nKQppZiB0ZXN0IC10IDE7IHRoZW4KcHJpbnRmICclc1xuJyAiJF9jdHgiIHwgaGVhZCAtbjEKZmkKcHJpbnRmICclc1xuJyAiJF9jdHgiIFwKfCBhd2sgJ3tpZihOUiA+IDEpIHtwcmludH19JyBcCnwgc29ydCAtdCAiJF9zZXAiIC1rJHtfY3VycmVudF9jb2x9cgpmaQopCl9rZnNfYWRkb25zX2t1YmVjdGxfYWxpYXNfY29tcGxldGUga24gJ2dldCBucyAtLW5vLWhlYWRlcnMgLW8gY3VzdG9tLWNvbHVtbnM9IjoubWV0YWRhdGEubmFtZSInCmtuKCkgKAppZiBjb21tYW5kIC12IGt1YmVmcyA+L2Rldi9udWxsIDI+JjE7IHRoZW4KZXhwb3J0IEtVQkVDT05GSUc9JChrdWJlZnMpCmZpCmlmIHRlc3QgIiQxIjsgdGhlbgprdWJlY3RsIGNvbmZpZyBzZXQtY29udGV4dCAkMQplbHNlCl9jdXJyZW50PSQoa3ViZWN0bCBjb25maWcgdmlldyAtLW1pbmlmeSAtbyBqc29ucGF0aD0iey4ubmFtZXNwYWNlfSIpCl9hbGw9JChrdWJlY3RsIGdldCBucyAtbyBuYW1lIHwgY3V0IC1kLyAtZjIpCl9tYXhfbGVuPSQocHJpbnRmICclc1xuJyAiJF9hbGwiIHwgYXdrICd7cHJpbnQgbGVuZ3RofScgfCBzb3J0IC1ybiB8IGhlYWQgLW4xKQpfc2VwPSQnXHQnCl9ucz0kKHByaW50ZiAnJXNcbicgIiRfYWxsIiBcCnwgcHJpbnRmICclc1x0JXNcbiVzXG4nICdOQU1FJyAnQ1VSUkVOVCcgIiQoY2F0KSIgXAp8IGF3ayAtdiBDVVJSRU5UPSIkX2N1cnJlbnQiIC12IFNFUD0iJF9zZXAiIC12IE1BWExFTj0iJF9tYXhfbGVuIiAnCnsKcHJpbnRmICIlcyIsICQxCmZvcihpID0gMTsgaSA8PSAoTUFYTEVOLWxlbmd0aCgkMSkpOyBpKyspIHsKcHJpbnRmICIgIgp9CnByaW50ZiAiJXMiLFNFUAppZigkMSA9PSBDVVJSRU5UKSB7IHByaW50ZiAiJXMiLCAiKiIgfQplbHNlIHsgcHJpbnRmICIlcyIsICQyIH0KcHJpbnRmICJcbiIKfScpCmlmIHRlc3QgLXQgMTsgdGhlbgpwcmludGYgJyVzXG4nICIkX25zIiB8IGhlYWQgLW4xCmZpCnByaW50ZiAiJXNcbiIgIiRfbnMiIFwKfCBhd2sgJ3tpZihOUiA+IDEpIHtwcmludH19JyBcCnwgc29ydCAtdCAiJF9zZXAiIC1rMnIKZmkKKQo=' | base64 --decode > "$BINDIR/kubefs_addons"
chmod +x "$BINDIR/kubefs_addons"
