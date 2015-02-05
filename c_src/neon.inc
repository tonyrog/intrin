
// VADD.t = s8ms16,s32,s64,f32,u8,u16,u32,u64     D = N+M
DEF_void_Dd_Dn_Dm(_, vadd_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(_, vadd_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vadd_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(_, vadd_s64, int64x1_t, int64x1_t, int64x1_t)
DEF_void_Dd_Dn_Dm(_, vadd_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(_, vadd_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(_, vadd_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(_, vadd_u32, uint32x2_t, uint32x2_t, uint32x2_t)
DEF_void_Dd_Dn_Dm(_, vadd_u64, uint64x1_t, uint64x1_t, uint64x1_t)

// VADDQ.t = s8,s16,s32,s64,f32,u8,u16,u32,u64   D = N+M
DEF_void_Qd_Qn_Qm(_, vaddq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(_, vaddq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vaddq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(_, vaddq_s64, int64x2_t, int64x2_t, int64x2_t)
DEF_void_Qd_Qn_Qm(_, vaddq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(_, vaddq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(_, vaddq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(_, vaddq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
DEF_void_Qd_Qn_Qm(_, vaddq_u64, uint64x2_t, uint64x2_t, uint64x2_t)

// VADDL.t = s8,s16,s32,u8,u16,u32   D = N+M  (Long result)
DEF_void_Qd_Dn_Dm(_, vaddl_s8, int16x8_t, int8x8_t, int8x8_t)
DEF_void_Qd_Dn_Dm(_, vaddl_s16, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Dn_Dm(_, vaddl_s32, int64x2_t, int32x2_t, int32x2_t)
DEF_void_Qd_Dn_Dm(_, vaddl_u8, uint16x8_t, uint8x8_t, uint8x8_t)
DEF_void_Qd_Dn_Dm(_, vaddl_u16, uint32x4_t, uint16x4_t, uint16x4_t)
DEF_void_Qd_Dn_Dm(_, vaddl_u32, uint64x2_t, uint32x2_t, uint32x2_t)

// VADDW.t = s8,s16,s32,u8,u16,u32   D = N+M
DEF_void_Qd_Qn_Dm(_, vaddw_s8,  int16x8_t, int16x8_t, int8x8_t)
DEF_void_Qd_Qn_Dm(_, vaddw_s16, int32x4_t, int32x4_t, int16x4_t)
DEF_void_Qd_Qn_Dm(_, vaddw_s32, int64x2_t, int64x2_t, int32x2_t)
DEF_void_Qd_Qn_Dm(_, vaddw_u8,  uint16x8_t, uint16x8_t, uint8x8_t)
DEF_void_Qd_Qn_Dm(_, vaddw_u16, uint32x4_t, uint32x4_t, uint16x4_t)
DEF_void_Qd_Qn_Dm(_, vaddw_u32, uint64x2_t, uint64x2_t, uint32x2_t)

// VHADD.t = s8,s16,s32,u8,u16,u32,  D = (N+M)>>1
DEF_void_Dd_Dn_Dm(_, vhadd_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(_, vhadd_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vhadd_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(_, vhadd_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(_, vhadd_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(_, vhadd_u32, uint32x2_t, uint32x2_t, uint32x2_t)

// VHADDQ.t = s8,s16,s32,u8,u16,u32,  D = (N+M)>>1
DEF_void_Qd_Qn_Qm(_, vhaddq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(_, vhaddq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vhaddq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(_, vhaddq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(_, vhaddq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(_, vhaddq_u32, uint32x4_t, uint32x4_t, uint32x4_t)


// VRHADD.t = s8,s16,s32,u8,u16,u32,  D = (N+M)>>1
DEF_void_Dd_Dn_Dm(_, vrhadd_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(_, vrhadd_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vrhadd_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(_, vrhadd_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(_, vrhadd_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(_, vrhadd_u32, uint32x2_t, uint32x2_t, uint32x2_t)

// VRHADDQ.t = s8,s16,s32,u8,u16,u32,  D = (N+M)>>1
DEF_void_Qd_Qn_Qm(_, vrhaddq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(_, vrhaddq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vrhaddq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(_, vrhaddq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(_, vrhaddq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(_, vrhaddq_u32, uint32x4_t, uint32x4_t, uint32x4_t)

// VQADD.t = s8,s16,s32,s64,u8,u16,u32,u64  D = N+M (Saturate)
DEF_void_Dd_Dn_Dm(_, vqadd_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(_, vqadd_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vqadd_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(_, vqadd_s64, int64x1_t, int64x1_t, int64x1_t)
DEF_void_Dd_Dn_Dm(_, vqadd_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(_, vqadd_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(_, vqadd_u32, uint32x2_t, uint32x2_t, uint32x2_t)
DEF_void_Dd_Dn_Dm(_, vqadd_u64, uint64x1_t, uint64x1_t, uint64x1_t)

// VQADDQ.t = s8,s16,s32,s64,u8,u16,u32,u64  D = N+M (Saturate)
DEF_void_Qd_Qn_Qm(_, vqaddq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(_, vqaddq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vqaddq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(_, vqaddq_s64, int64x2_t, int64x2_t, int64x2_t)
DEF_void_Qd_Qn_Qm(_, vqaddq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(_, vqaddq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(_, vqaddq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
DEF_void_Qd_Qn_Qm(_, vqaddq_u64, uint64x2_t, uint64x2_t, uint64x2_t)

// VADDHN.type = s16,s32,s64,u16,u32,u64  D = N+M (Select high result)
DEF_void_Dd_Qn_Qm(_, vaddhn_s16, int8x8_t, int16x8_t, int16x8_t)
DEF_void_Dd_Qn_Qm(_, vaddhn_s32, int16x4_t, int32x4_t, int32x4_t)
DEF_void_Dd_Qn_Qm(_, vaddhn_s64, int32x2_t, int64x2_t, int64x2_t)
DEF_void_Dd_Qn_Qm(_, vaddhn_u16, uint8x8_t, uint16x8_t, uint16x8_t)
DEF_void_Dd_Qn_Qm(_, vaddhn_u32, uint16x4_t, uint32x4_t, uint32x4_t)
DEF_void_Dd_Qn_Qm(_, vaddhn_u64, uint32x2_t, uint64x2_t, uint64x2_t)

// VRADDHN.type = s16,s32,s64,u16,u32,u64 D = N+M Rounded (Select high result)
DEF_void_Dd_Qn_Qm(_, vraddhn_s16, int8x8_t, int16x8_t, int16x8_t)
DEF_void_Dd_Qn_Qm(_, vraddhn_s32, int16x4_t, int32x4_t, int32x4_t)
DEF_void_Dd_Qn_Qm(_, vraddhn_s64, int32x2_t, int64x2_t, int64x2_t)
DEF_void_Dd_Qn_Qm(_, vraddhn_u16, uint8x8_t, uint16x8_t, uint16x8_t)
DEF_void_Dd_Qn_Qm(_, vraddhn_u32, uint16x4_t, uint32x4_t, uint32x4_t)
DEF_void_Dd_Qn_Qm(_, vraddhn_u64, uint32x2_t, uint64x2_t, uint64x2_t)

// VMUL.type = s8,s16,s32,f32,u8,u16,u32,p8   D=N*M
DEF_void_Dd_Dn_Dm(_, vmul_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(_, vmul_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vmul_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(_, vmul_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(_, vmul_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(_, vmul_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(_, vmul_u32, uint32x2_t, uint32x2_t, uint32x2_t)
// DEF_void_Pd_Pn_Pm(_, vmul_p8,  poly8x8_t,  poly8x8_t, poly8x8_t)

// VMULQ.type = s8,s16,s32,f32,u8,u16,u32,p8   D=N*M
DEF_void_Qd_Qn_Qm(_, vmulq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(_, vmulq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vmulq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(_, vmulq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(_, vmulq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(_, vmulq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(_, vmulq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
// DEF_void_Pd_Pn_Pm(_, vmulq_p8,  poly8x16_t,  poly16x8_t, poly16x8_t)

// VQDMULH.type = s16,s32
DEF_void_Dd_Dn_Dm(_, vqdmulh_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vqdmulh_s32, int32x2_t, int32x2_t, int32x2_t)

// VQDMULHQ.type = s16,s32
DEF_void_Qd_Qn_Qm(_, vqdmulhq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vqdmulhq_s32, int32x4_t, int32x4_t, int32x4_t)

// VQRDMULH.type = s16,s32
DEF_void_Dd_Dn_Dm(_, vqrdmulh_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vqrdmulh_s32, int32x2_t, int32x2_t, int32x2_t)

// VQRDMULHQ.type = s16,s32
DEF_void_Qd_Qn_Qm(_, vqrdmulhq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vqrdmulhq_s32, int32x4_t, int32x4_t, int32x4_t)


// VMULL.type = s8,s16,s32,u8,u16,u32, p8
DEF_void_Qd_Dn_Dm(_, vmull_s8, int16x8_t, int8x8_t, int8x8_t)
DEF_void_Qd_Dn_Dm(_, vmull_s16, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Dn_Dm(_, vmull_s32, int64x2_t, int32x2_t, int32x2_t)
DEF_void_Qd_Dn_Dm(_, vmull_u8, uint16x8_t, uint8x8_t, uint8x8_t)
DEF_void_Qd_Dn_Dm(_, vmull_u16, uint32x4_t, uint16x4_t, uint16x4_t)
DEF_void_Qd_Dn_Dm(_, vmull_u32, uint64x2_t, uint32x2_t, uint32x2_t)
//DEF_void_Pd_pn_pm(_, vmull_p8, poly16x8, poly8x8_t, poly8x8_t)

// VQDMULL.type = s16,s32
DEF_void_Qd_Dn_Dm(_, vqdmull_s16, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Dn_Dm(_, vqdmull_s32, int64x2_t, int32x2_t, int32x2_t)

// VMLA.type = s8,s16,s32,f32,u8,u16,u32 (Muliply Accumulate) D=N*M+K
DEF_void_Dd_Dn_Dm_Dk(_, vmla_s8, int8x8_t, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm_Dk(_, vmla_s16, int16x4_t, int16x4_t, int16x4_t,  int16x4_t)
DEF_void_Dd_Dn_Dm_Dk(_, vmla_s32, int32x2_t, int32x2_t, int32x2_t,  int32x2_t)
DEF_void_Dd_Dn_Dm_Dk(_, vmla_f32, float32x2_t, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm_Dk(_, vmla_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm_Dk(_, vmla_u16, uint16x4_t, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm_Dk(_, vmla_u32, uint32x2_t, uint32x2_t, uint32x2_t, uint32x2_t)

// VMLAQ.type = s8.s16,s32,f32,u8,u16,u32
DEF_void_Qd_Qn_Qm_Qk(_, vmlaq_s8,  int8x16_t, int8x16_t, int8x16_t,int8x16_t)
DEF_void_Qd_Qn_Qm_Qk(_, vmlaq_s16, int16x8_t, int16x8_t, int16x8_t,int16x8_t)
DEF_void_Qd_Qn_Qm_Qk(_, vmlaq_s32, int32x4_t, int32x4_t, int32x4_t,int32x4_t)
DEF_void_Qd_Qn_Qm_Qk(_, vmlaq_f32, float32x4_t, float32x4_t, float32x4_t,  float32x4_t)
DEF_void_Qd_Qn_Qm_Qk(_, vmlaq_u8,  uint8x16_t, uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm_Qk(_, vmlaq_u16, uint16x8_t, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm_Qk(_, vmlaq_u32, uint32x4_t, uint32x4_t, uint32x4_t, uint32x4_t)

// VMLAL.type = s8,s16,s32,u8,u16,u32
DEF_void_Qd_Qn_Dm_Dk(_, vmlal_s8, int16x8_t, int16x8_t, int8x8_t, int8x8_t)
DEF_void_Qd_Qn_Dm_Dk(_, vmlal_s16, int32x4_t, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Qn_Dm_Dk(_, vmlal_s32, int64x2_t, int64x2_t, int32x2_t, int32x2_t)
DEF_void_Qd_Qn_Dm_Dk(_, vmlal_u8, uint16x8_t, uint16x8_t, uint8x8_t, uint8x8_t)
DEF_void_Qd_Qn_Dm_Dk(_, vmlal_u16, uint32x4_t, uint32x4_t, uint16x4_t, uint16x4_t)
DEF_void_Qd_Qn_Dm_Dk(_, vmlal_u32, uint64x2_t, uint64x2_t, uint32x2_t, uint32x2_t)

// VQDMLAL.type = s16,s32
DEF_void_Qd_Qn_Dm_Dk(_, vqdmlal_s16, int32x4_t, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Qn_Dm_Dk(_, vqdmlal_s32, int64x2_t, int64x2_t, int32x2_t, int32x2_t)

// VMLS.type = s8,s16,s32,f32,u8,u16,u32 (Muliply Subtract)
DEF_void_Dd_Dn_Dm_Dk(_, vmls_s8, int8x8_t, int8x8_t, int8x8_t,  int8x8_t)
DEF_void_Dd_Dn_Dm_Dk(_, vmls_s16, int16x4_t, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm_Dk(_, vmls_s32, int32x2_t, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm_Dk(_, vmls_f32, float32x2_t, float32x2_t, float32x2_t,  float32x2_t)
DEF_void_Dd_Dn_Dm_Dk(_, vmls_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm_Dk(_, vmls_u16, uint16x4_t, uint16x4_t, uint16x4_t,  uint16x4_t)
DEF_void_Dd_Dn_Dm_Dk(_, vmls_u32, uint32x2_t, uint32x2_t, uint32x2_t, uint32x2_t)

// VMLSQ.type = s8.s16,s32,f32,u8,u16,u32
DEF_void_Qd_Qn_Qm_Qk(_, vmlsq_s8,  int8x16_t, int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm_Qk(_, vmlsq_s16, int16x8_t, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm_Qk(_, vmlsq_s32, int32x4_t, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm_Qk(_, vmlsq_f32, float32x4_t, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm_Qk(_, vmlsq_u8,  uint8x16_t, uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm_Qk(_, vmlsq_u16, uint16x8_t, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm_Qk(_, vmlsq_u32, uint32x4_t, uint32x4_t, uint32x4_t, uint32x4_t)

// VMLSL.type = s8,s16,s32,u8,u16,u32
DEF_void_Qd_Qn_Dm_Dk(_, vmlsl_s8, int16x8_t, int16x8_t, int8x8_t, int8x8_t)
DEF_void_Qd_Qn_Dm_Dk(_, vmlsl_s16, int32x4_t, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Qn_Dm_Dk(_, vmlsl_s32, int64x2_t, int64x2_t, int32x2_t, int32x2_t)
DEF_void_Qd_Qn_Dm_Dk(_, vmlsl_u8, uint16x8_t, uint16x8_t, uint8x8_t, uint8x8_t)
DEF_void_Qd_Qn_Dm_Dk(_, vmlsl_u16, uint32x4_t, uint32x4_t, uint16x4_t, uint16x4_t)
DEF_void_Qd_Qn_Dm_Dk(_, vmlsl_u32, uint64x2_t, uint64x2_t, uint32x2_t, uint32x2_t)

// VQDMLSL.type = s16,s32
DEF_void_Qd_Qn_Dm_Dk(_, vqdmlsl_s16, int32x4_t, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Qn_Dm_Dk(_, vqdmlsl_s32, int64x2_t, int64x2_t, int32x2_t, int32x2_t)


// VFMA.type = f32
// VFMAQ.type = f32
// VFMS.type = f32
// VFMSQ.type = f32
// VRNDN.type = f32
// VRNDQN.type = f32
// VRNDA.type = f32
// VRNDQA.type = f32
// VRNDP.type = f32
// VRNDQP.type = f32
// VRNDM.type = f32
// VRNDQM.type = f32
// VRND.type = f32
// VRNDQ.type = f32

// VSUB.t = s8ms16,s32,s64,f32,u8,u16,u32,u64     D = N-M
DEF_void_Dd_Dn_Dm(_, vsub_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(_, vsub_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vsub_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(_, vsub_s64, int64x1_t, int64x1_t, int64x1_t)
DEF_void_Dd_Dn_Dm(_, vsub_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(_, vsub_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(_, vsub_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(_, vsub_u32, uint32x2_t, uint32x2_t, uint32x2_t)
DEF_void_Dd_Dn_Dm(_, vsub_u64, uint64x1_t, uint64x1_t, uint64x1_t)

// VSUBQ.t = s8,s16,s32,s64,f32,u8,u16,u32,u64   D = N-M
DEF_void_Qd_Qn_Qm(_, vsubq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(_, vsubq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vsubq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(_, vsubq_s64, int64x2_t, int64x2_t, int64x2_t)
DEF_void_Qd_Qn_Qm(_, vsubq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(_, vsubq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(_, vsubq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(_, vsubq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
DEF_void_Qd_Qn_Qm(_, vsubq_u64, uint64x2_t, uint64x2_t, uint64x2_t)

// VSUBL.t = s8,s16,s32,u8,u16,u32   D = N-M  (Long result)
DEF_void_Qd_Dn_Dm(_, vsubl_s8, int16x8_t, int8x8_t, int8x8_t)
DEF_void_Qd_Dn_Dm(_, vsubl_s16, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Dn_Dm(_, vsubl_s32, int64x2_t, int32x2_t, int32x2_t)
DEF_void_Qd_Dn_Dm(_, vsubl_u8, uint16x8_t, uint8x8_t, uint8x8_t)
DEF_void_Qd_Dn_Dm(_, vsubl_u16, uint32x4_t, uint16x4_t, uint16x4_t)
DEF_void_Qd_Dn_Dm(_, vsubl_u32, uint64x2_t, uint32x2_t, uint32x2_t)

// VSUBW.t = s8,s16,s32,u8,u16,u32   D = N-M
DEF_void_Qd_Qn_Dm(_, vsubw_s8,  int16x8_t, int16x8_t, int8x8_t)
DEF_void_Qd_Qn_Dm(_, vsubw_s16, int32x4_t, int32x4_t, int16x4_t)
DEF_void_Qd_Qn_Dm(_, vsubw_s32, int64x2_t, int64x2_t, int32x2_t)
DEF_void_Qd_Qn_Dm(_, vsubw_u8,  uint16x8_t, uint16x8_t, uint8x8_t)
DEF_void_Qd_Qn_Dm(_, vsubw_u16, uint32x4_t, uint32x4_t, uint16x4_t)
DEF_void_Qd_Qn_Dm(_, vsubw_u32, uint64x2_t, uint64x2_t, uint32x2_t)

// VHSUB.t = s8,s16,s32,u8,u16,u32,  D = (N-M)>>1
DEF_void_Dd_Dn_Dm(_, vhsub_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(_, vhsub_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vhsub_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(_, vhsub_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(_, vhsub_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(_, vhsub_u32, uint32x2_t, uint32x2_t, uint32x2_t)

// VHSUBQ.t = s8,s16,s32,u8,u16,u32,  D = (N-M)>>1
DEF_void_Qd_Qn_Qm(_, vhsubq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(_, vhsubq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vhsubq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(_, vhsubq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(_, vhsubq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(_, vhsubq_u32, uint32x4_t, uint32x4_t, uint32x4_t)

// VQSUB.t = s8,s16,s32,s64,u8,u16,u32,u64  D = N-M (Saturate)
DEF_void_Dd_Dn_Dm(_, vqsub_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(_, vqsub_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vqsub_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(_, vqsub_s64, int64x1_t, int64x1_t, int64x1_t)
DEF_void_Dd_Dn_Dm(_, vqsub_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(_, vqsub_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(_, vqsub_u32, uint32x2_t, uint32x2_t, uint32x2_t)
DEF_void_Dd_Dn_Dm(_, vqsub_u64, uint64x1_t, uint64x1_t, uint64x1_t)

// VQSUBQ.t = s8,s16,s32,s64,u8,u16,u32,u64  D = N-M (Saturate)
DEF_void_Qd_Qn_Qm(_, vqsubq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(_, vqsubq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vqsubq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(_, vqsubq_s64, int64x2_t, int64x2_t, int64x2_t)
DEF_void_Qd_Qn_Qm(_, vqsubq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(_, vqsubq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(_, vqsubq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
DEF_void_Qd_Qn_Qm(_, vqsubq_u64, uint64x2_t, uint64x2_t, uint64x2_t)

// VSUBHN.type = s16,s32,s64,u16,u32,u64  D = N-M (Select high result)
DEF_void_Dd_Qn_Qm(_, vsubhn_s16, int8x8_t, int16x8_t, int16x8_t)
DEF_void_Dd_Qn_Qm(_, vsubhn_s32, int16x4_t, int32x4_t, int32x4_t)
DEF_void_Dd_Qn_Qm(_, vsubhn_s64, int32x2_t, int64x2_t, int64x2_t)
DEF_void_Dd_Qn_Qm(_, vsubhn_u16, uint8x8_t, uint16x8_t, uint16x8_t)
DEF_void_Dd_Qn_Qm(_, vsubhn_u32, uint16x4_t, uint32x4_t, uint32x4_t)
DEF_void_Dd_Qn_Qm(_, vsubhn_u64, uint32x2_t, uint64x2_t, uint64x2_t)

// VRSUBHN.type = s16,s32,s64,u16,u32,u64 D = N-M Rounded (Select high result)
DEF_void_Dd_Qn_Qm(_, vrsubhn_s16, int8x8_t, int16x8_t, int16x8_t)
DEF_void_Dd_Qn_Qm(_, vrsubhn_s32, int16x4_t, int32x4_t, int32x4_t)
DEF_void_Dd_Qn_Qm(_, vrsubhn_s64, int32x2_t, int64x2_t, int64x2_t)
DEF_void_Dd_Qn_Qm(_, vrsubhn_u16, uint8x8_t, uint16x8_t, uint16x8_t)
DEF_void_Dd_Qn_Qm(_, vrsubhn_u32, uint16x4_t, uint32x4_t, uint32x4_t)
DEF_void_Dd_Qn_Qm(_, vrsubhn_u64, uint32x2_t, uint64x2_t, uint64x2_t)

// VCEQ.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Dd_Dn_Dm(_, vceq_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(_, vceq_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vceq_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(_, vceq_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(_, vceq_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(_, vceq_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(_, vceq_u32, uint32x2_t, uint32x2_t, uint32x2_t)
// DEF_void_Pd_Pn_Pm(_, vceq_p8,  poly8x8_t,  poly8x8_t, poly8x8_t)

// VCGE.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Dd_Dn_Dm(_, vcge_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(_, vcge_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vcge_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(_, vcge_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(_, vcge_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(_, vcge_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(_, vcge_u32, uint32x2_t, uint32x2_t, uint32x2_t)
// DEF_void_Pd_Pn_Pm(_, vcge_p8,  poly8x8_t,  poly8x8_t, poly8x8_t)

// VCLE.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Dd_Dn_Dm(_, vcle_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(_, vcle_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vcle_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(_, vcle_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(_, vcle_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(_, vcle_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(_, vcle_u32, uint32x2_t, uint32x2_t, uint32x2_t)
// DEF_void_Pd_Pn_Pm(_, vcle_p8,  poly8x8_t,  poly8x8_t, poly8x8_t)

// VCGT.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Dd_Dn_Dm(_, vcgt_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(_, vcgt_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vcgt_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(_, vcgt_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(_, vcgt_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(_, vcgt_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(_, vcgt_u32, uint32x2_t, uint32x2_t, uint32x2_t)
// DEF_void_Pd_Pn_Pm(_, vcgt_p8,  poly8x8_t,  poly8x8_t, poly8x8_t)

// VCLT.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Dd_Dn_Dm(_, vclt_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(_, vclt_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(_, vclt_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(_, vclt_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(_, vclt_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(_, vclt_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(_, vclt_u32, uint32x2_t, uint32x2_t, uint32x2_t)
// DEF_void_Pd_Pn_Pm(_, vclt_p8,  poly8x8_t,  poly8x8_t, poly8x8_t)

// VCEQQ.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Qd_Qn_Qm(_, vceqq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(_, vceqq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vceqq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(_, vceqq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(_, vceqq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(_, vceqq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(_, vceqq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
// DEF_void_Pd_Pn_Pm(_, vceqq_p8,  poly8x16_t,  poly16x8_t, poly16x8_t)

// VCGEQ.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Qd_Qn_Qm(_, vcgeq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(_, vcgeq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vcgeq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(_, vcgeq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(_, vcgeq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(_, vcgeq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(_, vcgeq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
// DEF_void_Pd_Pn_Pm(_, vcgeq_p8,  poly8x16_t,  poly16x8_t, poly16x8_t)

// VCLEQ.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Qd_Qn_Qm(_, vcleq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(_, vcleq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vcleq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(_, vcleq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(_, vcleq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(_, vcleq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(_, vcleq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
// DEF_void_Pd_Pn_Pm(_, vcleq_p8,  poly8x16_t,  poly16x8_t, poly16x8_t)

// VCGTQ.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Qd_Qn_Qm(_, vcgtq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(_, vcgtq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vcgtq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(_, vcgtq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(_, vcgtq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(_, vcgtq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(_, vcgtq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
// DEF_void_Pd_Pn_Pm(_, vcgeq_p8,  poly8x16_t,  poly16x8_t, poly16x8_t)

// VCLTQ.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Qd_Qn_Qm(_, vcltq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(_, vcltq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(_, vcltq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(_, vcltq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(_, vcltq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(_, vcltq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(_, vcltq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
// DEF_void_Pd_Pn_Pm(_, vcltq_p8,  poly8x16_t,  poly16x8_t, poly16x8_t)

// VCAGE.f32
// VCAGEQ.f32
// VCALE.f32
// VCALEQ.f32
// VCAGT.f32
// VCAGTQ.f32
// VCALT.f32
// VCALTQ.f32

// VTST.type = s8,s16,s32,u8,u16,u32,p8     D=-1*(N==M)  Test bits
// VTSTQ.type = s8,s16,s32,u8,u16,u32,p8    D=-1*(N==  Test bits 
// VABD.type = s8,s16,s32,f32,u8,u16,u32    D=|N-M| Absolute difference
// VABDQ.type = s8,s16,s32,f32,u8,u16,u32    D=|N-M| Absolute difference




