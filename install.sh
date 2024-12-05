#!/bin/sh
# https://github.com/dxlr8r/kubefs
if test ${UID:--1} -eq 0; then
  : ${KUBEFS_DIR:="/usr/share/kubefs"}
else
  : ${KUBEFS_DIR:="$HOME/.local/share/kubefs"}
fi
mkdir -p "$KUBEFS_DIR"
printf '%s\n' 'IyEvYmluL3NoCiMgaHR0cHM6Ly9naXRodWIuY29tL2R4bHI4ci9rdWJlZnMKX2tmc19iYXNoX2NvbXBsZXRlKCkgewpldmFsICIkKHByaW50ZiAnJXNcbicgWDJ0MVltVm1jMTlqYjIxd2JHVjBhVzl1YzE5bWFXeDBaWElvS1NCN0NteHZZMkZzSUhkdmNtUnpQU0lrTVNJS2JHOWpZV3dnWTNWeVBTUjdRMDlOVUY5WFQxSkVVMXREVDAxUVgwTlhUMUpFWFgwS2JHOWpZV3dnY21WemRXeDBQU2dwQ21sbUlGdGJJQ0lrZTJOMWNqb3dPakY5SWlBOVBTQWlMU0lnWFYwN0lIUm9aVzRLWldOb2J5QWlKSGR2Y21SeklncGxiSE5sQ21admNpQjNiM0prSUdsdUlDUjNiM0prY3pzZ1pHOEtXMXNnSWlSN2QyOXlaRG93T2pGOUlpQWhQU0FpTFNJZ1hWMGdKaVlnY21WemRXeDBLejBvSWlSM2IzSmtJaWtLWkc5dVpRcGxZMmh2SUNJa2UzSmxjM1ZzZEZzcVhYMGlDbVpwQ24wS1gydDFZbVZtYzE5amIyMXdiR1YwYVc5dWN5Z3BJSHNLYkc5allXd2dZM1Z5UFNSN1EwOU5VRjlYVDFKRVUxdERUMDFRWDBOWFQxSkVYWDBLYkc5allXd2dZMjl0Y0hkdmNtUnpQU2dpSkh0RFQwMVFYMWRQVWtSVFcwQmRPakU2SkVOUFRWQmZRMWRQVWtRdE1YMGlLUXBzYjJOaGJDQmpiMjF3YkdsdVpUMGlKSHRqYjIxd2QyOXlaSE5iS2wxOUlncGpZWE5sSUNJa1kyOXRjR3hwYm1VaUlHbHVDaWRzYjJOcklITmxjM05wYjI0Z2RHOW5aMnhsSnlvcENuZG9hV3hsSUhKbFlXUWdMWEk3SUdSdklFTlBUVkJTUlZCTVdTczlLQ0lrVWtWUVRGa2lLVHNnWkc5dVpTQThJRHdvWTI5dGNHZGxiaUF0VnlBaUpDaGZhM1ZpWldaelgyTnZiWEJzWlhScGIyNXpYMlpwYkhSbGNpQWlKQ2htYVc1a0lDSWtlMHRWUWtWR1UxOVNUMDlVT2kwa1NFOU5SUzh1YTNWaVpYMGlJQzEwZVhCbElHWWdMVzVoYldVZ0p5NXJkV0psWTI5dVptbG5KeUF5UGk5a1pYWXZiblZzYkNraUtTSWdMUzBnSWlSamRYSWlLUW83T3dvbmJHOWpheUJuYkc5aVlXd2dkRzluWjJ4bEp5b3BDbmRvYVd4bElISmxZV1FnTFhJN0lHUnZJRU5QVFZCU1JWQk1XU3M5S0NJa1VrVlFURmtpS1RzZ1pHOXVaU0E4SUR3b1kyOXRjR2RsYmlBdFZ5QWlKQ2hmYTNWaVpXWnpYMk52YlhCc1pYUnBiMjV6WDJacGJIUmxjaUFpSkNobWFXNWtJQ0lrZTB0VlFrVkdVMTlTVDA5VU9pMGtTRTlOUlM4dWEzVmlaWDBpSUMxMGVYQmxJR1lnTFc1aGJXVWdKeTVyZFdKbFkyOXVabWxuSnlBeVBpOWtaWFl2Ym5Wc2JDa2lLU0lnTFMwZ0lpUmpkWElpS1FvN093b25iRzlqYXlCelpYTnphVzl1SUd4cGMzUW5LaWtLZDJocGJHVWdjbVZoWkNBdGNqc2daRzhnUTA5TlVGSkZVRXhaS3owb0lpUlNSVkJNV1NJcE95QmtiMjVsSUR3Z1BDaGpiMjF3WjJWdUlDMVhJQ0lrS0Y5cmRXSmxabk5mWTI5dGNHeGxkR2x2Ym5OZlptbHNkR1Z5SUNJaUtTSWdMUzBnSWlSamRYSWlLUW83T3dvbmJHOWpheUJuYkc5aVlXd2diR2x6ZENjcUtRcDNhR2xzWlNCeVpXRmtJQzF5T3lCa2J5QkRUMDFRVWtWUVRGa3JQU2dpSkZKRlVFeFpJaWs3SUdSdmJtVWdQQ0E4S0dOdmJYQm5aVzRnTFZjZ0lpUW9YMnQxWW1WbWMxOWpiMjF3YkdWMGFXOXVjMTltYVd4MFpYSWdJaUlwSWlBdExTQWlKR04xY2lJcENqczdDaWRzYjJOcklITmxjM05wYjI0Z2MyVjBKeW9wQ25kb2FXeGxJSEpsWVdRZ0xYSTdJR1J2SUVOUFRWQlNSVkJNV1NzOUtDSWtVa1ZRVEZraUtUc2daRzl1WlNBOElEd29ZMjl0Y0dkbGJpQXRWeUFpSkNoZmEzVmlaV1p6WDJOdmJYQnNaWFJwYjI1elgyWnBiSFJsY2lBaUpDaG1hVzVrSUNJa2UwdFZRa1ZHVTE5U1QwOVVPaTBrU0U5TlJTOHVhM1ZpWlgwaUlDMTBlWEJsSUdZZ0xXNWhiV1VnSnk1cmRXSmxZMjl1Wm1sbkp5QXlQaTlrWlhZdmJuVnNiQ2tpS1NJZ0xTMGdJaVJqZFhJaUtRbzdPd29uYkc5amF5QnpaWE56YVc5dUlHUmxiQ2NxS1FwM2FHbHNaU0J5WldGa0lDMXlPeUJrYnlCRFQwMVFVa1ZRVEZrclBTZ2lKRkpGVUV4WklpazdJR1J2Ym1VZ1BDQThLR052YlhCblpXNGdMVmNnSWlRb1gydDFZbVZtYzE5amIyMXdiR1YwYVc5dWMxOW1hV3gwWlhJZ0lpSXBJaUF0TFNBaUpHTjFjaUlwQ2pzN0NpZHNiMk5ySUhObGMzTnBiMjRnWjJWMEp5b3BDbmRvYVd4bElISmxZV1FnTFhJN0lHUnZJRU5QVFZCU1JWQk1XU3M5S0NJa1VrVlFURmtpS1RzZ1pHOXVaU0E4SUR3b1kyOXRjR2RsYmlBdFZ5QWlKQ2hmYTNWaVpXWnpYMk52YlhCc1pYUnBiMjV6WDJacGJIUmxjaUFpSWlraUlDMHRJQ0lrWTNWeUlpa0tPenNLSjJ4dlkyc2daMnh2WW1Gc0lITmxkQ2NxS1FwM2FHbHNaU0J5WldGa0lDMXlPeUJrYnlCRFQwMVFVa1ZRVEZrclBTZ2lKRkpGVUV4WklpazdJR1J2Ym1VZ1BDQThLR052YlhCblpXNGdMVmNnSWlRb1gydDFZbVZtYzE5amIyMXdiR1YwYVc5dWMxOW1hV3gwWlhJZ0lpUW9abWx1WkNBaUpIdExWVUpGUmxOZlVrOVBWRG90SkVoUFRVVXZMbXQxWW1WOUlpQXRkSGx3WlNCbUlDMXVZVzFsSUNjdWEzVmlaV052Ym1acFp5Y2dNajR2WkdWMkwyNTFiR3dwSWlraUlDMHRJQ0lrWTNWeUlpa0tPenNLSjJ4dlkyc2daMnh2WW1Gc0lHUmxiQ2NxS1FwM2FHbHNaU0J5WldGa0lDMXlPeUJrYnlCRFQwMVFVa1ZRVEZrclBTZ2lKRkpGVUV4WklpazdJR1J2Ym1VZ1BDQThLR052YlhCblpXNGdMVmNnSWlRb1gydDFZbVZtYzE5amIyMXdiR1YwYVc5dWMxOW1hV3gwWlhJZ0lpSXBJaUF0TFNBaUpHTjFjaUlwQ2pzN0NpZHNiMk5ySUdkc2IySmhiQ0JuWlhRbktpa0tkMmhwYkdVZ2NtVmhaQ0F0Y2pzZ1pHOGdRMDlOVUZKRlVFeFpLejBvSWlSU1JWQk1XU0lwT3lCa2IyNWxJRHdnUENoamIyMXdaMlZ1SUMxWElDSWtLRjlyZFdKbFpuTmZZMjl0Y0d4bGRHbHZibk5mWm1sc2RHVnlJQ0lpS1NJZ0xTMGdJaVJqZFhJaUtRbzdPd29uYkc5amF5QnpaWE56YVc5dUp5b3BDbmRvYVd4bElISmxZV1FnTFhJN0lHUnZJRU5QVFZCU1JWQk1XU3M5S0NJa1VrVlFURmtpS1RzZ1pHOXVaU0E4SUR3b1kyOXRjR2RsYmlBdFZ5QWlKQ2hmYTNWaVpXWnpYMk52YlhCc1pYUnBiMjV6WDJacGJIUmxjaUFpYzJWMElIUnZaMmRzWlNCa1pXd2daMlYwSUd4cGMzUWlLU0lnTFMwZ0lpUmpkWElpS1FvN093b25iRzlqYXlCbmJHOWlZV3duS2lrS2QyaHBiR1VnY21WaFpDQXRjanNnWkc4Z1EwOU5VRkpGVUV4Wkt6MG9JaVJTUlZCTVdTSXBPeUJrYjI1bElEd2dQQ2hqYjIxd1oyVnVJQzFYSUNJa0tGOXJkV0psWm5OZlkyOXRjR3hsZEdsdmJuTmZabWxzZEdWeUlDSnpaWFFnZEc5bloyeGxJR1JsYkNCblpYUWdiR2x6ZENJcElpQXRMU0FpSkdOMWNpSXBDanM3Q2lkc2FYTjBMV0ZzYkNjcUtRcDNhR2xzWlNCeVpXRmtJQzF5T3lCa2J5QkRUMDFRVWtWUVRGa3JQU2dpSkZKRlVFeFpJaWs3SUdSdmJtVWdQQ0E4S0dOdmJYQm5aVzRnTFZjZ0lpUW9YMnQxWW1WbWMxOWpiMjF3YkdWMGFXOXVjMTltYVd4MFpYSWdJaUlwSWlBdExTQWlKR04xY2lJcENqczdDaWRzYVhOMEp5b3BDbmRvYVd4bElISmxZV1FnTFhJN0lHUnZJRU5QVFZCU1JWQk1XU3M5S0NJa1VrVlFURmtpS1RzZ1pHOXVaU0E4SUR3b1kyOXRjR2RsYmlBdFZ5QWlKQ2hmYTNWaVpXWnpYMk52YlhCc1pYUnBiMjV6WDJacGJIUmxjaUFpSWlraUlDMHRJQ0lrWTNWeUlpa0tPenNLSjJGMWRHZ25LaWtLZDJocGJHVWdjbVZoWkNBdGNqc2daRzhnUTA5TlVGSkZVRXhaS3owb0lpUlNSVkJNV1NJcE95QmtiMjVsSUR3Z1BDaGpiMjF3WjJWdUlDMVhJQ0lrS0Y5cmRXSmxabk5mWTI5dGNHeGxkR2x2Ym5OZlptbHNkR1Z5SUNJa0tHWnBibVFnSWlSN1MxVkNSVVpUWDFKUFQxUTZMU1JJVDAxRkx5NXJkV0psZlNJZ0xYUjVjR1VnWmlBdGJtRnRaU0FuTG10MVltVmhkWFJvSnlBeVBpOWtaWFl2Ym5Wc2JDa2lLU0lnTFMwZ0lpUmpkWElpS1FvN093b25iRzlqYXljcUtRcDNhR2xzWlNCeVpXRmtJQzF5T3lCa2J5QkRUMDFRVWtWUVRGa3JQU2dpSkZKRlVFeFpJaWs3SUdSdmJtVWdQQ0E4S0dOdmJYQm5aVzRnTFZjZ0lpUW9YMnQxWW1WbWMxOWpiMjF3YkdWMGFXOXVjMTltYVd4MFpYSWdJbWRzYjJKaGJDQnpaWE56YVc5dUlpa2lJQzB0SUNJa1kzVnlJaWtLT3pzS0oyZGxkQ2NxS1FwM2FHbHNaU0J5WldGa0lDMXlPeUJrYnlCRFQwMVFVa1ZRVEZrclBTZ2lKRkpGVUV4WklpazdJR1J2Ym1VZ1BDQThLR052YlhCblpXNGdMVmNnSWlRb1gydDFZbVZtYzE5amIyMXdiR1YwYVc5dWMxOW1hV3gwWlhJZ0lpSXBJaUF0TFNBaUpHTjFjaUlwQ2pzN0NpZGpaQ2NxS1FwM2FHbHNaU0J5WldGa0lDMXlPeUJrYnlCRFQwMVFVa1ZRVEZrclBTZ2lKRkpGVUV4WklpazdJR1J2Ym1VZ1BDQThLR052YlhCblpXNGdMVmNnSWlRb1gydDFZbVZtYzE5amIyMXdiR1YwYVc5dWMxOW1hV3gwWlhJZ0lpUW9abWx1WkNBaUpIdExWVUpGUmxOZlVrOVBWRG90SkVoUFRVVXZMbXQxWW1WOUlpQXRkSGx3WlNCbUlDMXVZVzFsSUNjdWEzVmlaV052Ym1acFp5Y2dMV1Y0WldNZ1pHbHlibUZ0WlNCN2ZTQmNPeUF5UGk5a1pYWXZiblZzYkNraUtTSWdMUzBnSWlSamRYSWlLUW83T3dvcUtRcDNhR2xzWlNCeVpXRmtJQzF5T3lCa2J5QkRUMDFRVWtWUVRGa3JQU2dpSkZKRlVFeFpJaWs3SUdSdmJtVWdQQ0E4S0dOdmJYQm5aVzRnTFZjZ0lpUW9YMnQxWW1WbWMxOWpiMjF3YkdWMGFXOXVjMTltYVd4MFpYSWdJbWRsZENCalpDQnNhWE4wSUd4cGMzUXRZV3hzSUdGMWRHZ2diRzlqYXlJcElpQXRMU0FpSkdOMWNpSXBDanM3Q21WellXTUtmU0FtSmdwamIyMXdiR1YwWlNBdFJpQmZhM1ZpWldaelgyTnZiWEJzWlhScGIyNXpJR3QxWW1WbWN3bz0gfCBiYXNlNjQgLS1kZWNvZGUpIgp9Cl9rZnNfcHJpbnRmX3N0ZGVycigpIHsKaWYgdGVzdCAiJCMiIC1lcSAwOyB0aGVuCl9rZnNfcHJpbnRmX3N0ZGVyciAnJXNcbicgIiQoY2F0KSIKZWxzZQpwcmludGYgLS0gIiRAIiA+L2Rldi9zdGRlcnIKZmkKfQpfa2ZtX2lwcmludGYoKSB7CmlmIGNhc2UgIiR7LTotfSIgaW4gKmkqKSB0cnVlOzsgKikgZmFsc2U7OyBlc2FjIHx8IHRlc3QgLW4gIiR7S1VCRUZTX0RFQlVHOi19IjsgdGhlbgppZiB0ZXN0ICIkIyIgLWVxIDA7IHRoZW4KY2F0IHwgX2tmc19wcmludGZfc3RkZXJyCmVsc2UKX2tmc19wcmludGZfc3RkZXJyICIkQCIKZmkKZmkKfQpfa2ZzX2RlYnVnKCkgewppZiB0ZXN0IC1uICIke0tVQkVGU19ERUJVRzotfSI7IHRoZW4KaWYgdGVzdCAiJCMiIC1lcSAwOyB0aGVuCmNhdCB8IF9rZnNfcHJpbnRmX3N0ZGVycgplbHNlCl9rZnNfcHJpbnRmX3N0ZGVyciAiJEAiCmZpCmZpCn0KX2tmc19wYXJlbnRzKCkgKApkaXJuYW1lPSIkezE6LSQocHdkKX0iCmlmIHRlc3QgIiRkaXJuYW1lIiAhPSAnLyc7IHRoZW4KcHJpbnRmICclc1xuJyAiJGRpcm5hbWUiCl9rZnNfcGFyZW50cyAiJChkaXJuYW1lICIkZGlybmFtZSIpIgplbHNlCnByaW50ZiAnL1xuJwpyZXR1cm4gMApmaQopCl9rZnNfZGlybmFtZSgpICgKaWYgdGVzdCAtZCAiJHsxOi19IjsgdGhlbgpwcmludGYgJyVzXG4nICIkMSIKZWxpZiB0ZXN0IC1lICIkezE6LX0iOyB0aGVuCmRpcm5hbWUgIiQxIgplbHNlCjoKZmkKKQpfa2ZzX3Jlc29sdmVfc3ltbGluaygpIHsKYXdrIFwKLXYgTElOSz0iJDEiIFwKLXYgTElTVD0iJChMQ19BTEw9QyBjb21tYW5kIGxzIC1sICIkMSIpIiBcCidCRUdJTiB7CkxJTktfTEVOPWxlbmd0aChMSU5LKQpMSU5LX1BPUz1pbmRleChMSVNULCBMSU5LKTsKcHJpbnQgc3Vic3RyKExJU1QsIExJTktfUE9TK0xJTktfTEVOKzQpCn0nCn0KX2tmc19maW5kX2t1YmVjb25maWcoKSAoCmlmIHRlc3QgLW4gIiR7TE9DS19LVUJFQ09ORklHOi19IjsgdGhlbgpjYW5kaWRhdGU9IiRMT0NLX0tVQkVDT05GSUciCmVsc2UKY2FuZGlkYXRlPSQoXApfa2ZzX3BhcmVudHMgIiR7MTotfSIgXAp8IHhhcmdzIC1JIHt9IGxzIC0xIHt9Ly5rdWJlY29uZmlnIDI+L2Rldi9udWxsIFwKfCBoZWFkIC1uMSBcCikKZmkKa3ViZWNvbmZpZz0ke2NhbmRpZGF0ZTotJEhPTUUvLmt1YmUvY29uZmlnfQpwcmludGYgJyVzXG4nICIka3ViZWNvbmZpZyIKX2tmc19kZWJ1ZyAnIyBLVUJFQ09ORklHPSIlcyJcbicgIiRrdWJlY29uZmlnIgopCl9rZnNfbG9ja19zZXNzaW9uX3NldCgpIHsKX2tmc19kaXJuYW1lPSQoX2tmc19kaXJuYW1lICIkezE6LX0iKQpleHBvcnQgTE9DS19LVUJFQ09ORklHPSQoX2tmc19maW5kX2t1YmVjb25maWcgIiRfa2ZzX2Rpcm5hbWUiKQpleHBvcnQgS1VCRUNPTkZJRz0iJExPQ0tfS1VCRUNPTkZJRyIKX2tmbV9pcHJpbnRmICcjIExPQ0tfS1VCRUNPTkZJRz0iJXMiXG4nICIkTE9DS19LVUJFQ09ORklHIgp9Cl9rZnNfbG9ja19zZXNzaW9uX2RlbCgpIHsKdGVzdCAiJHtLVUJFQ09ORklHOi19IiA9ICIke0xPQ0tfS1VCRUNPTkZJRzotfSIgJiYgdW5zZXQgS1VCRUNPTkZJRyB8fCA6CnVuc2V0IExPQ0tfS1VCRUNPTkZJRwpfa2ZtX2lwcmludGYgJyMgdW5zZXQgTE9DS19LVUJFQ09ORklHXG4nCn0KX2tmc19sb2NrX3Nlc3Npb25fdG9nZ2xlKCkgewppZiB0ZXN0IC16ICIkezE6LX0iIC1hIC1uICIkTE9DS19LVUJFQ09ORklHIjsgdGhlbgpfa2ZzX2xvY2tfc2Vzc2lvbl9kZWwKZWxzZQpfa2ZzX2xvY2tfc2Vzc2lvbl9zZXQgIiR7MTotfSIKZmkKfQpfa2ZzX2xvY2tfc2Vzc2lvbl9nZXQoKSAoCmlmIHRlc3QgLW4gIiRMT0NLX0tVQkVDT05GSUciOyB0aGVuCnRlc3QgIiR7MTotfSIgPSAibGlzdCIgXAomJiBwcmludGYgJ0xPQ0tfS1VCRUNPTkZJRz0iJXMiXG4nICIkKF9rZnNfbG9ja19zZXNzaW9uX2dldCkiIFwKfHwgcHJpbnRmICclc1xuJyAiJExPQ0tfS1VCRUNPTkZJRyIKZmkKKQpfa2ZzX2xvY2tfZ2xvYmFsX3NldCgpICgKX2tmc19kaXJuYW1lPSQoX2tmc19kaXJuYW1lICIkezE6LX0iKQprdWJlY29uZmlnPSQoX2tmc19maW5kX2t1YmVjb25maWcgIiRfa2ZzX2Rpcm5hbWUiKQppZiB0ZXN0ICIka3ViZWNvbmZpZyIgPSAiJEhPTUUvLmt1YmUvY29uZmlnIjsgdGhlbgpfa2ZzX3ByaW50Zl9zdGRlcnIgJyMgSU5GTzogbm8gYC5rdWJlY29uZmlnYCBmb3VuZCBpbiBkaXJlY3RvcnkgYCVzYC5cbicgIiQocHdkKSIKcmV0dXJuIDEKZWxzZQp0ZXN0IC1MICIkSE9NRS8ua3ViZS9jb25maWciICYmIHVubGluayAiJEhPTUUvLmt1YmUvY29uZmlnIiB8fCA6CmlmICEgdGVzdCAtZSAiJEhPTUUvLmt1YmUvY29uZmlnIjsgdGhlbgpsbiAtcyAiJGt1YmVjb25maWciICIkSE9NRS8ua3ViZS9jb25maWciCl9rZm1faXByaW50ZiAnIyBsbiAtcyAiJXMiICIlcyJcbicgIiRrdWJlY29uZmlnIiAiJEhPTUUvLmt1YmUvY29uZmlnIgplbHNlCl9rZnNfcHJpbnRmX3N0ZGVyciAnIyBFUlJPUjogYCVzYCBub3QgYSBzeW1saW5rLlxuJyAiJEhPTUUvLmt1YmUvY29uZmlnIgpmaQpmaQopCl9rZnNfbG9ja19nbG9iYWxfZGVsKCkgKAppZiB1bmxpbmsgIiRIT01FLy5rdWJlL2NvbmZpZyIgMj4vZGV2L251bGw7IHRoZW4KX2tmbV9pcHJpbnRmICcjIHVubGluayAiJXMiXG4nICIkSE9NRS8ua3ViZS9jb25maWciCmVsc2UKX2tmc19wcmludGZfc3RkZXJyICcjIFdBUk5JTkc6IGAlc2Agbm90IGEgc3ltbGluay5cbicgIiRIT01FLy5rdWJlL2NvbmZpZyIKZmkKKQpfa2ZzX2xvY2tfZ2xvYmFsX3RvZ2dsZSgpICgKaWYgdGVzdCAteiAiJHsxOi19IiAtYSAtTCAiJEhPTUUvLmt1YmUvY29uZmlnIjsgdGhlbgpfa2ZzX2xvY2tfZ2xvYmFsX2RlbAplbHNlCl9rZnNfbG9ja19nbG9iYWxfc2V0ICIkezE6LX0iCmZpCikKX2tmc19sb2NrX2dsb2JhbF9nZXQoKSAoCmlmIHRlc3QgLUwgIiRIT01FLy5rdWJlL2NvbmZpZyI7IHRoZW4KdGVzdCAiJHsxOi19IiA9ICJsaXN0IiAmJiBwcmludGYgJyVzIC0+ICcgIiRIT01FLy5rdWJlL2NvbmZpZyIgfHwgOgpwcmludGYgJyVzXG4nICIkKF9rZnNfcmVzb2x2ZV9zeW1saW5rICIkSE9NRS8ua3ViZS9jb25maWciKSIKZmkKKQpfa2ZzX2t1YmVhdXRoKCkgKAppZiB0ZXN0IC1uICIke0xPQ0tfS1VCRUNPTkZJRzotfSI7IHRoZW4KX2tmc19wcmludGZfc3RkZXJyICcjIElORk86IENhbiBub3QgZXhlY3V0ZSBhdXRoZW50aWNhdGUgd2hpbGUgYExPQ0tfS1VCRUNPTkZJR2AgaXMgc2V0LlxuJwpyZXR1cm4gMApmaQpfa2ZzX2Rpcm5hbWU9JChfa2ZzX2Rpcm5hbWUgIiR7MTotfSIpCmlmIFwKc2VhcmNoX2t1YmVhdXRoPSQoXApfa2ZzX3BhcmVudHMgIiRfa2ZzX2Rpcm5hbWUiIFwKfCB4YXJncyAtSSB7fSBscyAtMSB7fS8ua3ViZWF1dGggMj4vZGV2L251bGwgXAp8IGhlYWQgLW4xIFwKKTsKdGVzdCAtbiAiJHNlYXJjaF9rdWJlYXV0aCI7IHRoZW4Ka3ViZWF1dGg9IiRzZWFyY2hfa3ViZWF1dGgiCmVsc2UKX2tmc19wcmludGZfc3RkZXJyICIjIFdBUk5JTkc6IENvdWxkIG5vdCBmaW5kIGFueSBcYC5rdWJlYXV0aFxgIGluIHBhdGggb3IgcGFyZW50cycgcGF0aHNcbiIKcmV0dXJuIDEKZmkKdGVzdCAteCAiJGt1YmVhdXRoIiB8fCBjaG1vZCAreCAiJGt1YmVhdXRoIgpfa2ZzX2RlYnVnICcjIGt1YmVhdXRoPSIlcyJcbicgIiRrdWJlYXV0aCIKZXhwb3J0IEtVQkVDT05GSUc9JChfa2ZzX2ZpbmRfa3ViZWNvbmZpZyAiJF9rZnNfZGlybmFtZSIpCiIka3ViZWF1dGgiCikKX2tmc19rdWJlY3RsKCkgKApleHBvcnQgS1VCRUNPTkZJRz0kKF9rZnNfZmluZF9rdWJlY29uZmlnKQpjb21tYW5kIGt1YmVjdGwgIiRAIgopCl9rZnNfY2QoKSB7CmlmIHRlc3QgLXogIiR7MTotfSI7IHRoZW4KaWYgX2tmc193aGljaCBfa2ZzX2NtZF9jZF9ob29rOyB0aGVuCl9rZnNfY21kX2NkX2hvb2sKZWxzZQpfa2ZzX2NtZCBnZXQKZmkKZWxzZQppZiB0ZXN0IC1mICIkMS8ua3ViZWNvbmZpZyI7IHRoZW4KY29tbWFuZCBjZCAtLSAiJDEiCmVsc2UKX2tmc19wcmludGZfc3RkZXJyICcjIElORk86IG5vIGAua3ViZWNvbmZpZ2AgZm91bmQgaW4gZGlyZWN0b3J5IGAlc2AuXG4nICIkMSIKZmkKZmkKfQpfa2ZzX2NtZCgpIHsKY2FzZSAkezE6LWdldH0gaW4KY3RsfGt1YmVjdGwpCnNoaWZ0Cl9rZnNfa3ViZWN0bCAiJEAiCjs7Cmd8Z2V0KQpwcmludGYgJyVzXG4nICIkKF9rZnNfZmluZF9rdWJlY29uZmlnKSIKOzsKY2R8anVtcCkKc2hpZnQKX2tmc19jZCAiJHsxOi19Igo7Owpsc3xsaXN0KQpwcmludGYgJ0tVQkVDT05GSUc9IiVzIlxuJyAiJChfa2ZzX2NtZCBnZXQpIgo7OwpsYXxsc2F8bGlzdC1hbGwpCl9rZnNfY21kIGxpc3QKX2tmc19jbWQgbG9jayBzZXNzaW9uIGxpc3QKX2tmc19jbWQgbG9jayBnbG9iYWwgbGlzdAo7OwphdXRofGF1dGhlbnRpY2F0ZSkKX2tmc19rdWJlYXV0aCAiJHsyOi19Igo7Owpsb2NrKQpjYXNlICR7Mjotc2Vzc2lvbn0gaW4KZ2xvYmFsKQpjYXNlICR7Mzotc2V0fSBpbgpkZWx8ZGVsZXRlfHJtfHJlbW92ZXx1bnNldCkKX2tmc19sb2NrX2dsb2JhbF9kZWwKOzsKdG9nZ2xlKQpfa2ZzX2xvY2tfZ2xvYmFsX3RvZ2dsZSAiJHs0Oi19Igo7OwpnfGdldCkKX2tmc19sb2NrX2dsb2JhbF9nZXQgZ2V0Cjs7CmxzfGxpc3QpCl9rZnNfbG9ja19nbG9iYWxfZ2V0IGxpc3QKOzsKc2V0fGFkZHxtaykKX2tmc19sb2NrX2dsb2JhbF9zZXQgIiR7NDotfSIKOzsKaGVscHwqKQo6Cjs7CmVzYWMKOzsKc2Vzc2lvbikKY2FzZSAkezM6LXNldH0gaW4KZGVsfGRlbGV0ZXxybXxyZW1vdmV8dW5zZXQpCl9rZnNfbG9ja19zZXNzaW9uX2RlbAo7Owp0b2dnbGUpCl9rZnNfbG9ja19zZXNzaW9uX3RvZ2dsZSAiJHs0Oi19Igo7OwpnfGdldCkKX2tmc19sb2NrX3Nlc3Npb25fZ2V0IGdldAo7Owpsc3xsaXN0KQpfa2ZzX2xvY2tfc2Vzc2lvbl9nZXQgbGlzdAo7OwpzZXR8YWRkfG1rKQpfa2ZzX2xvY2tfc2Vzc2lvbl9zZXQgIiR7NDotfSIKOzsKaGVscHwqKQo6Cjs7CmVzYWMKOzsKaGVscHwqKQo6Cjs7CmVzYWMKOzsKaGVscHwqKQo6Cjs7CmVzYWMKfQpfa2ZzX3doaWNoKCkgewp3aGlsZSB0ZXN0ICIkIyIgLWd0IDA7IGRvCmNvbW1hbmQgLXYgIiQxIiA+L2Rldi9udWxsIDI+JjEgfHwgcmV0dXJuICQ/CnNoaWZ0CmRvbmUKfQpfa2ZzX2FsaWFzKCkgewphbGlhcyAkMT0iX2tmc19jbWQgJDIiCl9rZnNfd2hpY2ggX2t1YmVmc19jb21wbGV0aW9ucyB8fCByZXR1cm4gMApldmFsICIkKHByaW50ZiAiCl9rdWJlZnNfY29tcGxldGlvbnNfJDEoKSB7CmxvY2FsIGNvbXBsCmNvbXBsPVwke0NPTVBfV09SRFNbQF06MX0KKCggQ09NUF9DV09SRCArPSAyICkpCkNPTVBfV09SRFM9KCBrdWJlY3RsICckMicgXCJcJHtjb21wbDotIH1cIiApCl9rdWJlZnNfY29tcGxldGlvbnMKfQpjb21wbGV0ZSAtbyBkZWZhdWx0IC1GIF9rdWJlZnNfY29tcGxldGlvbnNfJDEgJDEKIikiCn0KX2tmc19pbml0X3NvdXJjZWQoKSB7CmFsaWFzIGt1YmVmcz0nX2tmc19jbWQnCn0KX2tmc19pbml0X2ludGVyYWN0aXZlKCkgewp1bnNldCBLVUJFQ09ORklHIExPQ0tfS1VCRUNPTkZJRwppZgp0ZXN0ICIke0tVQkVGU19DT01QTEVUSU9OOi10cnVlfSIgPSAndHJ1ZScgJiYKX2tmc193aGljaCBfZ2V0X2NvbXBfd29yZHNfYnlfcmVmCnRoZW4KX2tmc19iYXNoX2NvbXBsZXRlCmZpCmlmIHRlc3QgIiR7S1VCRUZTX1JFQ09NTUVOREVEX0FMSUFTOi10cnVlfSIgPSAndHJ1ZSc7IHRoZW4KYWxpYXMga3ViZWN0bD0nX2tmc19rdWJlY3RsJwphbGlhcyBrZj0nX2tmc19jbWQnCl9rZnNfd2hpY2ggX2t1YmVmc19jb21wbGV0aW9ucyAmJiBjb21wbGV0ZSAtRiBfa3ViZWZzX2NvbXBsZXRpb25zIGtmIHx8IDoKZmkKaWYgdGVzdCAiJHtLVUJFRlNfT1BUSU9OQUxfQUxJQVM6LXRydWV9IiA9ICd0cnVlJzsgdGhlbgpfa2ZzX2FsaWFzIGtmZyAnbG9jayBnbG9iYWwgdG9nZ2xlJwpfa2ZzX2FsaWFzIGtmZSAnbG9jayBzZXNzaW9uIHNldCcKX2tmc19hbGlhcyBrZmwgJ2xvY2sgc2Vzc2lvbiB0b2dnbGUnCl9rZnNfYWxpYXMga2ZjICdjZCcKYWxpYXMga2Zscz0nX2tmc19jbWQgbGlzdC1hbGwnCmFsaWFzIGtmYT0nX2tmc19jbWQgYXV0aCcKZm9yIHRvb2wgaW4gJChwcmludGYgJyVzXG4nICR7S1VCRUZTX1RPT0w6LWhlbG19IHwgdHIgJzonICcgJyk7IGRvCmNvbW1hbmQgLXYgJHRvb2wgPi9kZXYvbnVsbCAyPiYxIFwKJiYgYWxpYXMgJHRvb2w9IktVQkVDT05GSUc9XCQoa2YpIGNvbW1hbmQgJHRvb2wiIHx8IGNvbnRpbnVlCmRvbmUKZmkKfQppZiB0ZXN0ICIkKGJhc2VuYW1lIC0tICIkMCIgJy5zaCcpIiA9ICdrdWJlZnMnOyB0aGVuCl9rZnNfY21kICIkQCIKcHJpbnRmIC0tICctLS0KV0FSTklORzogZXhlY3V0aW5nIGBrdWJlZnNgIGFzIGFuIGV4ZWN1dGFibGUgaXMgbm90IHJlY29tbWVuZGVkLlxuCk9ubHkgdGhlIGZvbGxvd2luZyBjb21tYW5kcyBmaWxsIHdvcmsgaW4gdGhpcyBtb2RlOlxuCi0gY3RsCi0gZ2V0Ci0gbHMKLSBsc2EsIGV4Y2VwdCBzZXNzaW9uCi0gYXV0aAotIGxvY2sgZ2xvYmFsXG4KVGhlIHJlY29tbWVuZGVkIHdheSBpcyB0byBzb3VyY2UgaXQsIHRoYXQgYmUgaW4geW91ciBzaGVsbCBvciBzY3JpcHQuCi0tLVxuJyBcCnwgc2VkIC1FICdzI15cc3syfSMjJyB8IF9rZnNfcHJpbnRmX3N0ZGVycgplbHNlCl9rZnNfaW5pdF9zb3VyY2VkCmlmCmNhc2UgIiR7LTotfSIgaW4gKmkqKSB0cnVlOzsgKikgZmFsc2U7OyBlc2FjICYmCnRlc3QgLXQgMSAmJgp0ZXN0ICIkeyM6LTB9IiAtZXEgMAp0aGVuCl9rZnNfaW5pdF9pbnRlcmFjdGl2ZQpmaQpmaQo=' | base64 --decode > "$KUBEFS_DIR/kubefs.sh"
printf '%s\n' 'IyEvYmluL3NoCiMgaHR0cHM6Ly9naXRodWIuY29tL2R4bHI4ci9rdWJlZnMKIyBoYXZpbmcgYC5rdWJlYXV0aGAgYW5kIGAua3ViZWNvbmZpZ2AgaW4gdGhlIHNhbWUgZGlyZWN0b3J5IGlzIGEgZ29vZCBwcmFjdGljZS4gQnV0IG5vdCByZXF1aXJlZCBieSBrdWJlZnMuCgpFTVBUWV9LVUJFQ09ORklHPSdhcGlWZXJzaW9uOiB2MQpraW5kOiBDb25maWcKY2x1c3RlcnM6IFtdCmNvbnRleHRzOiBbXQpjdXJyZW50LWNvbnRleHQ6ICIiCnVzZXJzOiBbXScKClNQQVRIPSQoQ0RQQVRIPSBjZCAtLSAiJChkaXJuYW1lIC0tICIkMCIpIiAmJiBwd2QpCiMgY2hlY2sgaWYgLmt1YmVjb25maWcgZXhpc3QgaW4gdGhlIHNhbWUgZGlyZWN0b3J5IGFzIGt1YmVsb2dpbl9pbml0IGlzIGNhbGxlZC9zb3VyY2VkCmlmICEgdGVzdCAtZiAiJHtTUEFUSH0vLmt1YmVjb25maWciOyB0aGVuCiAgcHJpbnRmICclc1xuJyAiJEVNUFRZX0tVQkVDT05GSUciID4gIiR7U1BBVEh9Ly5rdWJlY29uZmlnIgogIGNobW9kIDYwMCAiJHtTUEFUSH0vLmt1YmVjb25maWciCmZpCmV4cG9ydCBLVUJFQ09ORklHPSIke1NQQVRIfS8ua3ViZWNvbmZpZyIKCmt1YmVjdGwgYXV0aCBjYW4taSAtLWxpc3QgPi9kZXYvbnVsbCAyPiYxIFwKJiYgS1VCRV9BVVRIRU5USUNBVEVEPXRydWUgXAp8fCB1bnNldCBLVUJFX0FVVEhFTlRJQ0FURUQK' | base64 --decode > "$KUBEFS_DIR/kubeauth_init.sh"
printf '%s\n' 'IyEvYmluL3NoCiMgaHR0cHM6Ly9naXRodWIuY29tL2R4bHI4ci9rdWJlZnMKX2tmc19hZGRvbnNfa3ViZWN0bF9hbGlhc19jb21wbGV0ZSgpIHsKdGVzdCAiJHtLVUJFRlNfQ09NUExFVElPTjotdHJ1ZX0iID0gJ3RydWUnIHx8IHJldHVybiAwCnRlc3QgLXQgMSB8fCByZXR1cm4gMApjb21tYW5kIC12IF9nZXRfY29tcF93b3Jkc19ieV9yZWYgPi9kZXYvbnVsbCAyPiYxIHx8IHJldHVybiAwCmNvbW1hbmQgLXYgX19zdGFydF9rdWJlY3RsID4vZGV2L251bGwgMj4mMSB8fCByZXR1cm4gMApldmFsICIkKHByaW50ZiAiCl9rdWJlY3RsX2NvbXBsZXRpb25zXyQxKCkgewpsb2NhbCBjb21wbApjb21wbD1cJHtDT01QX1dPUkRTW0BdOjF9CigoIENPTVBfQ1dPUkQgKz0gMiApKQpDT01QX1dPUkRTPSgga3ViZWN0bCAkMiBcIlwke2NvbXBsOi0gfVwiICkKX19zdGFydF9rdWJlY3RsCn0KY29tcGxldGUgLW8gZGVmYXVsdCAtRiBfa3ViZWN0bF9jb21wbGV0aW9uc18kMSAkMQoiKSIKfQpfa2ZzX2FkZG9uc19rdWJlY3RsX2FsaWFzX2NvbXBsZXRlIGt4ICdjb25maWcgdXNlLWNvbnRleHQnCmt4KCkgKAppZiBjb21tYW5kIC12IGt1YmVmcyA+L2Rldi9udWxsIDI+JjE7IHRoZW4KZXhwb3J0IEtVQkVDT05GSUc9JChrdWJlZnMpCmZpCmlmIHRlc3QgIiQxIjsgdGhlbgprdWJlY3RsIGNvbmZpZyB1c2UtY29udGV4dCAiJDEiCmVsc2UKX3JjdHg9JChrdWJlY3RsIGNvbmZpZyBnZXQtY29udGV4dHMpCl9oZWFkZXI9JChwcmludGYgJyVzXG4nICIkX3JjdHgiIHwgaGVhZCAtbjEpCl9tYXhfbGVuPSQocHJpbnRmICclc1xuJyAiJF9yY3R4IiB8IGF3ayAne3ByaW50IGxlbmd0aH0nIHwgc29ydCAtcm4gfCBoZWFkIC1uMSkKX3NlcD0kJ1x0JwpfY29sdW1ucz0ke0tYX0NPTFVNTlM6LSdOQU1FLE5BTUVTUEFDRSxDTFVTVEVSLENVUlJFTlQnfQpfY3R4PSQocHJpbnRmICclc1xuJyAiJF9yY3R4IiBcCnwgYXdrIC12IFNFUD0iJF9zZXAiIC12IENPTFVNTlM9IiRfY29sdW1ucyIgXAotdiBIRUFEPSIkX2hlYWRlciIgLXYgTUFYTEVOPSIkX21heF9sZW4iIFwKJ0JFR0lOIHsKc3BsaXQoQ09MVU1OUywgVENPTCwgIiwiKQpUQ09MX0xFTj0wOyBmb3IoQ09MIGluIFRDT0wpeyBUQ09MX0xFTisrIH0KR0FQPTM7CkNVUlJFTlRfU1RBUlQ9MDsKQ1VSUkVOVF9MRU49aW5kZXgoSEVBRCwgIk5BTUUiKS0xOwpOQU1FX1NUQVJUPUNVUlJFTlRfTEVOKzE7Ck5BTUVfTEVOPWluZGV4KEhFQUQsICJDTFVTVEVSIiktTkFNRV9TVEFSVDsKQ0xVU1RFUl9TVEFSVD1OQU1FX1NUQVJUK05BTUVfTEVOCkNMVVNURVJfTEVOPWluZGV4KEhFQUQsICJBVVRISU5GTyIpLUNMVVNURVJfU1RBUlQ7CkFVVEhJTkZPX1NUQVJUPUNMVVNURVJfU1RBUlQrQ0xVU1RFUl9MRU4KQVVUSElORk9fTEVOPWluZGV4KEhFQUQsICJOQU1FU1BBQ0UiKS1BVVRISU5GT19TVEFSVDsKTkFNRVNQQUNFX1NUQVJUPUFVVEhJTkZPX1NUQVJUK0FVVEhJTkZPX0xFTgpOQU1FU1BBQ0VfTEVOPU1BWExFTi1OQU1FU1BBQ0VfU1RBUlQ7Cn0KewpEQ09MWyJDVVJSRU5UIl09c3Vic3RyKCQwLCBDVVJSRU5UX1NUQVJULCBDVVJSRU5UX0xFTi1HQVApOwpEQ09MWyJOQU1FIl09c3Vic3RyKCQwLCBOQU1FX1NUQVJULCBOQU1FX0xFTi1HQVApOwpEQ09MWyJDTFVTVEVSIl09c3Vic3RyKCQwLCBDTFVTVEVSX1NUQVJULCBDTFVTVEVSX0xFTi1HQVApOwpEQ09MWyJBVVRISU5GTyJdPXN1YnN0cigkMCwgQVVUSElORk9fU1RBUlQsIEFVVEhJTkZPX0xFTi1HQVApOwpfTkFNRVNQQUNFPXN1YnN0cigkMCwgTkFNRVNQQUNFX1NUQVJUKTsKZm9yIChpID0gMDsgaSA8PSAoTUFYTEVOLWxlbmd0aCgkMCktMSk7IGkrKykgeyBfTkFNRVNQQUNFPV9OQU1FU1BBQ0UgIiAiIH0KRENPTFsiTkFNRVNQQUNFIl09X05BTUVTUEFDRQpmb3IoaT0xOyBpIDw9IFRDT0xfTEVOOyBpKyspIHsKcHJpbnRmICIlcyIsIERDT0xbVENPTFtpXV0KaWYoaSA8IFRDT0xfTEVOKSB7IHByaW50ZiAiJXMiLCBTRVAgfQp9CnByaW50ZiAiXG4iCn0nKQpfY3VycmVudF9jb2w9JChcCnByaW50ZiAnJXMnICIkX2NvbHVtbnMiIFwKfCB0ciAsICdcbidcCnwgYXdrICd7aWYoJDEgPT0gIkNVUlJFTlQiKSB7cHJpbnQgTlJ9IH0nKQppZiB0ZXN0IC10IDE7IHRoZW4KcHJpbnRmICclc1xuJyAiJF9jdHgiIHwgaGVhZCAtbjEKZmkKcHJpbnRmICclc1xuJyAiJF9jdHgiIFwKfCBhd2sgJ3tpZihOUiA+IDEpIHtwcmludH19JyBcCnwgc29ydCAtdCAiJF9zZXAiIC1rJHtfY3VycmVudF9jb2x9cgpmaQopCl9rZnNfYWRkb25zX2t1YmVjdGxfYWxpYXNfY29tcGxldGUga24gJ2dldCBucyAtLW5vLWhlYWRlcnMgLW8gY3VzdG9tLWNvbHVtbnM9IjoubWV0YWRhdGEubmFtZSInCmtuKCkgKAppZiBjb21tYW5kIC12IGt1YmVmcyA+L2Rldi9udWxsIDI+JjE7IHRoZW4KZXhwb3J0IEtVQkVDT05GSUc9JChrdWJlZnMpCmZpCmlmIHRlc3QgIiQxIjsgdGhlbgprdWJlY3RsIGNvbmZpZyBzZXQtY29udGV4dCAkMQplbHNlCl9jdXJyZW50PSQoa3ViZWN0bCBjb25maWcgdmlldyAtLW1pbmlmeSAtbyBqc29ucGF0aD0iey4ubmFtZXNwYWNlfSIpCl9hbGw9JChrdWJlY3RsIGdldCBucyAtbyBuYW1lIHwgY3V0IC1kLyAtZjIpCl9tYXhfbGVuPSQocHJpbnRmICclc1xuJyAiJF9hbGwiIHwgYXdrICd7cHJpbnQgbGVuZ3RofScgfCBzb3J0IC1ybiB8IGhlYWQgLW4xKQpfc2VwPSQnXHQnCl9ucz0kKHByaW50ZiAnJXNcbicgIiRfYWxsIiBcCnwgcHJpbnRmICclc1x0JXNcbiVzXG4nICdOQU1FJyAnQ1VSUkVOVCcgIiQoY2F0KSIgXAp8IGF3ayAtdiBDVVJSRU5UPSIkX2N1cnJlbnQiIC12IFNFUD0iJF9zZXAiIC12IE1BWExFTj0iJF9tYXhfbGVuIiAnCnsKcHJpbnRmICIlcyIsICQxCmZvcihpID0gMTsgaSA8PSAoTUFYTEVOLWxlbmd0aCgkMSkpOyBpKyspIHsKcHJpbnRmICIgIgp9CnByaW50ZiAiJXMiLFNFUAppZigkMSA9PSBDVVJSRU5UKSB7IHByaW50ZiAiJXMiLCAiKiIgfQplbHNlIHsgcHJpbnRmICIlcyIsICQyIH0KcHJpbnRmICJcbiIKfScpCmlmIHRlc3QgLXQgMTsgdGhlbgpwcmludGYgJyVzXG4nICIkX25zIiB8IGhlYWQgLW4xCmZpCnByaW50ZiAiJXNcbiIgIiRfbnMiIFwKfCBhd2sgJ3tpZihOUiA+IDEpIHtwcmludH19JyBcCnwgc29ydCAtdCAiJF9zZXAiIC1rMnIKZmkKKQprdWJlYXV0aF9pbml0KCkgewppZiB0ZXN0IC1lICIkezE6LSQocHdkKX0vLmt1YmVhdXRoIjsgdGhlbgpwcmludGYgJ0VSUk9SOiBgJXNgIGFscmVhZHkgZXhpc3RzLlxuJyAiJHsxOi19Ly5rdWJlYXV0aCIgPiAvZGV2L3N0ZGVycgpyZXR1cm4gMQplbHNlCnByaW50ZiAnJWInICcjIS9iaW4vc2hcbnNldCAtZVxuXG4jIHNvdXJjZSBrdWJlYXV0aF9pbml0LnNoXG4uICRIT01FLy5sb2NhbC9zaGFyZS9rdWJlZnMva3ViZWF1dGhfaW5pdC5zaCAyPi9kZXYvbnVsbCB8fCBcXFxuLiAvdXNyL3NoYXJlL2t1YmVmcy9rdWJlYXV0aF9pbml0LnNoXG5cbiMgaWYgYWxyZWFkeSBhdGhlbnRpY2F0ZWQsIGV4aXRcbnRlc3QgLW4gIiR7S1VCRV9BVVRIRU5USUNBVEVEOi19IiAmJiBleGl0IHx8IDpcblxuIyBteWF1dGhfY21kXG4nID4gIiR7MTotJChwd2QpfS8ua3ViZWF1dGgiCmZpCn0K' | base64 --decode > "$KUBEFS_DIR/kubefs_addons.sh"
