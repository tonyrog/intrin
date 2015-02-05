// VADD.t = s8ms16,s32,s64,f32,u8,u16,u32,u64     D = N+M
DEF_void_Dd_Dn_Dm(vadd_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(vadd_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vadd_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(vadd_s64, int64x1_t, int64x1_t, int64x1_t)
DEF_void_Dd_Dn_Dm(vadd_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(vadd_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(vadd_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(vadd_u32, uint32x2_t, uint32x2_t, uint32x2_t)
DEF_void_Dd_Dn_Dm(vadd_u64, uint64x1_t, uint64x1_t, uint64x1_t)

// VADDQ.t = s8,s16,s32,s64,f32,u8,u16,u32,u64   D = N+M
DEF_void_Qd_Qn_Qm(vaddq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(vaddq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vaddq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(vaddq_s64, int64x2_t, int64x2_t, int64x2_t)
DEF_void_Qd_Qn_Qm(vaddq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(vaddq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(vaddq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(vaddq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
DEF_void_Qd_Qn_Qm(vaddq_u64, uint64x2_t, uint64x2_t, uint64x2_t)

// VADDL.t = s8,s16,s32,u8,u16,u32   D = N+M  (Long result)
DEF_void_Qd_Dn_Dm(vaddl_s8, int16x8_t, int8x8_t, int8x8_t)
DEF_void_Qd_Dn_Dm(vaddl_s16, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Dn_Dm(vaddl_s32, int64x2_t, int32x2_t, int32x2_t)
DEF_void_Qd_Dn_Dm(vaddl_u8, uint16x8_t, uint8x8_t, uint8x8_t)
DEF_void_Qd_Dn_Dm(vaddl_u16, uint32x4_t, uint16x4_t, uint16x4_t)
DEF_void_Qd_Dn_Dm(vaddl_u32, uint64x2_t, uint32x2_t, uint32x2_t)

// VADDW.t = s8,s16,s32,u8,u16,u32   D = N+M
DEF_void_Qd_Qn_Dm(vaddw_s8,  int16x8_t, int16x8_t, int8x8_t)
DEF_void_Qd_Qn_Dm(vaddw_s16, int32x4_t, int32x4_t, int16x4_t)
DEF_void_Qd_Qn_Dm(vaddw_s32, int64x2_t, int64x2_t, int32x2_t)
DEF_void_Qd_Qn_Dm(vaddw_u8,  uint16x8_t, uint16x8_t, uint8x8_t)
DEF_void_Qd_Qn_Dm(vaddw_u16, uint32x4_t, uint32x4_t, uint16x4_t)
DEF_void_Qd_Qn_Dm(vaddw_u32, uint64x2_t, uint64x2_t, uint32x2_t)

// VHADD.t = s8,s16,s32,u8,u16,u32,  D = (N+M)>>1
DEF_void_Dd_Dn_Dm(vhadd_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(vhadd_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vhadd_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(vhadd_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(vhadd_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(vhadd_u32, uint32x2_t, uint32x2_t, uint32x2_t)

// VHADDQ.t = s8,s16,s32,u8,u16,u32,  D = (N+M)>>1
DEF_void_Qd_Qn_Qm(vhaddq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(vhaddq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vhaddq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(vhaddq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(vhaddq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(vhaddq_u32, uint32x4_t, uint32x4_t, uint32x4_t)


// VRHADD.t = s8,s16,s32,u8,u16,u32,  D = (N+M)>>1
DEF_void_Dd_Dn_Dm(vrhadd_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(vrhadd_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vrhadd_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(vrhadd_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(vrhadd_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(vrhadd_u32, uint32x2_t, uint32x2_t, uint32x2_t)

// VRHADDQ.t = s8,s16,s32,u8,u16,u32,  D = (N+M)>>1
DEF_void_Qd_Qn_Qm(vrhaddq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(vrhaddq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vrhaddq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(vrhaddq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(vrhaddq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(vrhaddq_u32, uint32x4_t, uint32x4_t, uint32x4_t)

// VQADD.t = s8,s16,s32,s64,u8,u16,u32,u64  D = N+M (Saturate)
DEF_void_Dd_Dn_Dm(vqadd_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(vqadd_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vqadd_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(vqadd_s64, int64x1_t, int64x1_t, int64x1_t)
DEF_void_Dd_Dn_Dm(vqadd_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(vqadd_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(vqadd_u32, uint32x2_t, uint32x2_t, uint32x2_t)
DEF_void_Dd_Dn_Dm(vqadd_u64, uint64x1_t, uint64x1_t, uint64x1_t)

// VQADDQ.t = s8,s16,s32,s64,u8,u16,u32,u64  D = N+M (Saturate)
DEF_void_Qd_Qn_Qm(vqaddq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(vqaddq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vqaddq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(vqaddq_s64, int64x2_t, int64x2_t, int64x2_t)
DEF_void_Qd_Qn_Qm(vqaddq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(vqaddq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(vqaddq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
DEF_void_Qd_Qn_Qm(vqaddq_u64, uint64x2_t, uint64x2_t, uint64x2_t)

// VADDHN.t = s16,s32,s64,u16,u32,u64  D = N+M (Select high result)
DEF_void_Dd_Qn_Qm(vaddhn_s16, int8x8_t, int16x8_t, int16x8_t)
DEF_void_Dd_Qn_Qm(vaddhn_s32, int16x4_t, int32x4_t, int32x4_t)
DEF_void_Dd_Qn_Qm(vaddhn_s64, int32x2_t, int64x2_t, int64x2_t)
DEF_void_Dd_Qn_Qm(vaddhn_u16, uint8x8_t, uint16x8_t, uint16x8_t)
DEF_void_Dd_Qn_Qm(vaddhn_u32, uint16x4_t, uint32x4_t, uint32x4_t)
DEF_void_Dd_Qn_Qm(vaddhn_u64, uint32x2_t, uint64x2_t, uint64x2_t)

// VRADDHN.t = s16,s32,s64,u16,u32,u64 D = N+M Rounded (Select high result)
DEF_void_Dd_Qn_Qm(vraddhn_s16, int8x8_t, int16x8_t, int16x8_t)
DEF_void_Dd_Qn_Qm(vraddhn_s32, int16x4_t, int32x4_t, int32x4_t)
DEF_void_Dd_Qn_Qm(vraddhn_s64, int32x2_t, int64x2_t, int64x2_t)
DEF_void_Dd_Qn_Qm(vraddhn_u16, uint8x8_t, uint16x8_t, uint16x8_t)
DEF_void_Dd_Qn_Qm(vraddhn_u32, uint16x4_t, uint32x4_t, uint32x4_t)
DEF_void_Dd_Qn_Qm(vraddhn_u64, uint32x2_t, uint64x2_t, uint64x2_t)

// VMUL.t = s8,s16,s32,f32,u8,u16,u32,p8   D=N*M
DEF_void_Dd_Dn_Dm(vmul_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(vmul_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vmul_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(vmul_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(vmul_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(vmul_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(vmul_u32, uint32x2_t, uint32x2_t, uint32x2_t)
// DEF_void_Pd_Pn_Pm(vmul_p8,  poly8x8_t,  poly8x8_t, poly8x8_t)

// VMULQ.t = s8,s16,s32,f32,u8,u16,u32,p8   D=N*M
DEF_void_Qd_Qn_Qm(vmulq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(vmulq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vmulq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(vmulq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(vmulq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(vmulq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(vmulq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
// DEF_void_Pd_Pn_Pm(vmulq_p8,  poly8x16_t,  poly16x8_t, poly16x8_t)

// VQDMULH.t = s16,s32
DEF_void_Dd_Dn_Dm(vqdmulh_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vqdmulh_s32, int32x2_t, int32x2_t, int32x2_t)

// VQDMULHQ.t = s16,s32
DEF_void_Qd_Qn_Qm(vqdmulhq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vqdmulhq_s32, int32x4_t, int32x4_t, int32x4_t)

// VQRDMULH.t = s16,s32
DEF_void_Dd_Dn_Dm(vqrdmulh_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vqrdmulh_s32, int32x2_t, int32x2_t, int32x2_t)

// VQRDMULHQ.t = s16,s32
DEF_void_Qd_Qn_Qm(vqrdmulhq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vqrdmulhq_s32, int32x4_t, int32x4_t, int32x4_t)


// VMULL.t = s8,s16,s32,u8,u16,u32, p8
DEF_void_Qd_Dn_Dm(vmull_s8, int16x8_t, int8x8_t, int8x8_t)
DEF_void_Qd_Dn_Dm(vmull_s16, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Dn_Dm(vmull_s32, int64x2_t, int32x2_t, int32x2_t)
DEF_void_Qd_Dn_Dm(vmull_u8, uint16x8_t, uint8x8_t, uint8x8_t)
DEF_void_Qd_Dn_Dm(vmull_u16, uint32x4_t, uint16x4_t, uint16x4_t)
DEF_void_Qd_Dn_Dm(vmull_u32, uint64x2_t, uint32x2_t, uint32x2_t)
//DEF_void_Pd_pn_pm(vmull_p8, poly16x8, poly8x8_t, poly8x8_t)

// VQDMULL.t = s16,s32
DEF_void_Qd_Dn_Dm(vqdmull_s16, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Dn_Dm(vqdmull_s32, int64x2_t, int32x2_t, int32x2_t)

// VMLA.t = s8,s16,s32,f32,u8,u16,u32 (Muliply Accumulate) D=N*M+K
DEF_void_Dd_Dn_Dm_Dk(vmla_s8, int8x8_t, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm_Dk(vmla_s16, int16x4_t, int16x4_t, int16x4_t,  int16x4_t)
DEF_void_Dd_Dn_Dm_Dk(vmla_s32, int32x2_t, int32x2_t, int32x2_t,  int32x2_t)
DEF_void_Dd_Dn_Dm_Dk(vmla_f32, float32x2_t, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm_Dk(vmla_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm_Dk(vmla_u16, uint16x4_t, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm_Dk(vmla_u32, uint32x2_t, uint32x2_t, uint32x2_t, uint32x2_t)

// VMLAQ.t = s8.s16,s32,f32,u8,u16,u32
DEF_void_Qd_Qn_Qm_Qk(vmlaq_s8,  int8x16_t, int8x16_t, int8x16_t,int8x16_t)
DEF_void_Qd_Qn_Qm_Qk(vmlaq_s16, int16x8_t, int16x8_t, int16x8_t,int16x8_t)
DEF_void_Qd_Qn_Qm_Qk(vmlaq_s32, int32x4_t, int32x4_t, int32x4_t,int32x4_t)
DEF_void_Qd_Qn_Qm_Qk(vmlaq_f32, float32x4_t, float32x4_t, float32x4_t,  float32x4_t)
DEF_void_Qd_Qn_Qm_Qk(vmlaq_u8,  uint8x16_t, uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm_Qk(vmlaq_u16, uint16x8_t, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm_Qk(vmlaq_u32, uint32x4_t, uint32x4_t, uint32x4_t, uint32x4_t)

// VMLAL.t = s8,s16,s32,u8,u16,u32
DEF_void_Qd_Qn_Dm_Dk(vmlal_s8, int16x8_t, int16x8_t, int8x8_t, int8x8_t)
DEF_void_Qd_Qn_Dm_Dk(vmlal_s16, int32x4_t, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Qn_Dm_Dk(vmlal_s32, int64x2_t, int64x2_t, int32x2_t, int32x2_t)
DEF_void_Qd_Qn_Dm_Dk(vmlal_u8, uint16x8_t, uint16x8_t, uint8x8_t, uint8x8_t)
DEF_void_Qd_Qn_Dm_Dk(vmlal_u16, uint32x4_t, uint32x4_t, uint16x4_t, uint16x4_t)
DEF_void_Qd_Qn_Dm_Dk(vmlal_u32, uint64x2_t, uint64x2_t, uint32x2_t, uint32x2_t)

// VQDMLAL.t = s16,s32
DEF_void_Qd_Qn_Dm_Dk(vqdmlal_s16, int32x4_t, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Qn_Dm_Dk(vqdmlal_s32, int64x2_t, int64x2_t, int32x2_t, int32x2_t)

// VMLS.t = s8,s16,s32,f32,u8,u16,u32
DEF_void_Dd_Dn_Dm_Dk(vmls_s8, int8x8_t, int8x8_t, int8x8_t,  int8x8_t)
DEF_void_Dd_Dn_Dm_Dk(vmls_s16, int16x4_t, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm_Dk(vmls_s32, int32x2_t, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm_Dk(vmls_f32, float32x2_t, float32x2_t, float32x2_t,  float32x2_t)
DEF_void_Dd_Dn_Dm_Dk(vmls_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm_Dk(vmls_u16, uint16x4_t, uint16x4_t, uint16x4_t,  uint16x4_t)
DEF_void_Dd_Dn_Dm_Dk(vmls_u32, uint32x2_t, uint32x2_t, uint32x2_t, uint32x2_t)

// VMLSQ.t = s8.s16,s32,f32,u8,u16,u32
DEF_void_Qd_Qn_Qm_Qk(vmlsq_s8,  int8x16_t, int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm_Qk(vmlsq_s16, int16x8_t, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm_Qk(vmlsq_s32, int32x4_t, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm_Qk(vmlsq_f32, float32x4_t, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm_Qk(vmlsq_u8,  uint8x16_t, uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm_Qk(vmlsq_u16, uint16x8_t, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm_Qk(vmlsq_u32, uint32x4_t, uint32x4_t, uint32x4_t, uint32x4_t)

// VMLSL.t = s8,s16,s32,u8,u16,u32
DEF_void_Qd_Qn_Dm_Dk(vmlsl_s8, int16x8_t, int16x8_t, int8x8_t, int8x8_t)
DEF_void_Qd_Qn_Dm_Dk(vmlsl_s16, int32x4_t, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Qn_Dm_Dk(vmlsl_s32, int64x2_t, int64x2_t, int32x2_t, int32x2_t)
DEF_void_Qd_Qn_Dm_Dk(vmlsl_u8, uint16x8_t, uint16x8_t, uint8x8_t, uint8x8_t)
DEF_void_Qd_Qn_Dm_Dk(vmlsl_u16, uint32x4_t, uint32x4_t, uint16x4_t, uint16x4_t)
DEF_void_Qd_Qn_Dm_Dk(vmlsl_u32, uint64x2_t, uint64x2_t, uint32x2_t, uint32x2_t)

// VQDMLSL.t = s16,s32
DEF_void_Qd_Qn_Dm_Dk(vqdmlsl_s16, int32x4_t, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Qn_Dm_Dk(vqdmlsl_s32, int64x2_t, int64x2_t, int32x2_t, int32x2_t)


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

// VSUB.t = s8,s16,s32,s64,f32,u8,u16,u32,u64     D = N-M
DEF_void_Dd_Dn_Dm(vsub_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(vsub_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vsub_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(vsub_s64, int64x1_t, int64x1_t, int64x1_t)
DEF_void_Dd_Dn_Dm(vsub_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(vsub_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(vsub_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(vsub_u32, uint32x2_t, uint32x2_t, uint32x2_t)
DEF_void_Dd_Dn_Dm(vsub_u64, uint64x1_t, uint64x1_t, uint64x1_t)

// VSUBQ.t = s8,s16,s32,s64,f32,u8,u16,u32,u64   D = N-M
DEF_void_Qd_Qn_Qm(vsubq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(vsubq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vsubq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(vsubq_s64, int64x2_t, int64x2_t, int64x2_t)
DEF_void_Qd_Qn_Qm(vsubq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(vsubq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(vsubq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(vsubq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
DEF_void_Qd_Qn_Qm(vsubq_u64, uint64x2_t, uint64x2_t, uint64x2_t)

// VSUBL.t = s8,s16,s32,u8,u16,u32   D = N-M  (Long result)
DEF_void_Qd_Dn_Dm(vsubl_s8, int16x8_t, int8x8_t, int8x8_t)
DEF_void_Qd_Dn_Dm(vsubl_s16, int32x4_t, int16x4_t, int16x4_t)
DEF_void_Qd_Dn_Dm(vsubl_s32, int64x2_t, int32x2_t, int32x2_t)
DEF_void_Qd_Dn_Dm(vsubl_u8, uint16x8_t, uint8x8_t, uint8x8_t)
DEF_void_Qd_Dn_Dm(vsubl_u16, uint32x4_t, uint16x4_t, uint16x4_t)
DEF_void_Qd_Dn_Dm(vsubl_u32, uint64x2_t, uint32x2_t, uint32x2_t)

// VSUBW.t = s8,s16,s32,u8,u16,u32   D = N-M
DEF_void_Qd_Qn_Dm(vsubw_s8,  int16x8_t, int16x8_t, int8x8_t)
DEF_void_Qd_Qn_Dm(vsubw_s16, int32x4_t, int32x4_t, int16x4_t)
DEF_void_Qd_Qn_Dm(vsubw_s32, int64x2_t, int64x2_t, int32x2_t)
DEF_void_Qd_Qn_Dm(vsubw_u8,  uint16x8_t, uint16x8_t, uint8x8_t)
DEF_void_Qd_Qn_Dm(vsubw_u16, uint32x4_t, uint32x4_t, uint16x4_t)
DEF_void_Qd_Qn_Dm(vsubw_u32, uint64x2_t, uint64x2_t, uint32x2_t)

// VHSUB.t = s8,s16,s32,u8,u16,u32,  D = (N-M)>>1
DEF_void_Dd_Dn_Dm(vhsub_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(vhsub_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vhsub_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(vhsub_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(vhsub_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(vhsub_u32, uint32x2_t, uint32x2_t, uint32x2_t)

// VHSUBQ.t = s8,s16,s32,u8,u16,u32,  D = (N-M)>>1
DEF_void_Qd_Qn_Qm(vhsubq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(vhsubq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vhsubq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(vhsubq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(vhsubq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(vhsubq_u32, uint32x4_t, uint32x4_t, uint32x4_t)

// VQSUB.t = s8,s16,s32,s64,u8,u16,u32,u64  D = N-M (Saturate)
DEF_void_Dd_Dn_Dm(vqsub_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(vqsub_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vqsub_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(vqsub_s64, int64x1_t, int64x1_t, int64x1_t)
DEF_void_Dd_Dn_Dm(vqsub_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(vqsub_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(vqsub_u32, uint32x2_t, uint32x2_t, uint32x2_t)
DEF_void_Dd_Dn_Dm(vqsub_u64, uint64x1_t, uint64x1_t, uint64x1_t)

// VQSUBQ.t = s8,s16,s32,s64,u8,u16,u32,u64  D = N-M (Saturate)
DEF_void_Qd_Qn_Qm(vqsubq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(vqsubq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vqsubq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(vqsubq_s64, int64x2_t, int64x2_t, int64x2_t)
DEF_void_Qd_Qn_Qm(vqsubq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(vqsubq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(vqsubq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
DEF_void_Qd_Qn_Qm(vqsubq_u64, uint64x2_t, uint64x2_t, uint64x2_t)

// VSUBHN.type = s16,s32,s64,u16,u32,u64  D = N-M (Select high result)
DEF_void_Dd_Qn_Qm(vsubhn_s16, int8x8_t, int16x8_t, int16x8_t)
DEF_void_Dd_Qn_Qm(vsubhn_s32, int16x4_t, int32x4_t, int32x4_t)
DEF_void_Dd_Qn_Qm(vsubhn_s64, int32x2_t, int64x2_t, int64x2_t)
DEF_void_Dd_Qn_Qm(vsubhn_u16, uint8x8_t, uint16x8_t, uint16x8_t)
DEF_void_Dd_Qn_Qm(vsubhn_u32, uint16x4_t, uint32x4_t, uint32x4_t)
DEF_void_Dd_Qn_Qm(vsubhn_u64, uint32x2_t, uint64x2_t, uint64x2_t)

// VRSUBHN.type = s16,s32,s64,u16,u32,u64 D = N-M Rounded (Select high result)
DEF_void_Dd_Qn_Qm(vrsubhn_s16, int8x8_t, int16x8_t, int16x8_t)
DEF_void_Dd_Qn_Qm(vrsubhn_s32, int16x4_t, int32x4_t, int32x4_t)
DEF_void_Dd_Qn_Qm(vrsubhn_s64, int32x2_t, int64x2_t, int64x2_t)
DEF_void_Dd_Qn_Qm(vrsubhn_u16, uint8x8_t, uint16x8_t, uint16x8_t)
DEF_void_Dd_Qn_Qm(vrsubhn_u32, uint16x4_t, uint32x4_t, uint32x4_t)
DEF_void_Dd_Qn_Qm(vrsubhn_u64, uint32x2_t, uint64x2_t, uint64x2_t)

// VCEQ.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Dd_Dn_Dm(vceq_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(vceq_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vceq_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(vceq_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(vceq_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(vceq_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(vceq_u32, uint32x2_t, uint32x2_t, uint32x2_t)
// DEF_void_Pd_Pn_Pm(vceq_p8,  poly8x8_t,  poly8x8_t, poly8x8_t)

// VCGE.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Dd_Dn_Dm(vcge_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(vcge_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vcge_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(vcge_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(vcge_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(vcge_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(vcge_u32, uint32x2_t, uint32x2_t, uint32x2_t)
// DEF_void_Pd_Pn_Pm(vcge_p8,  poly8x8_t,  poly8x8_t, poly8x8_t)

// VCLE.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Dd_Dn_Dm(vcle_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(vcle_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vcle_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(vcle_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(vcle_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(vcle_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(vcle_u32, uint32x2_t, uint32x2_t, uint32x2_t)
// DEF_void_Pd_Pn_Pm(vcle_p8,  poly8x8_t,  poly8x8_t, poly8x8_t)

// VCGT.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Dd_Dn_Dm(vcgt_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(vcgt_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vcgt_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(vcgt_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(vcgt_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(vcgt_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(vcgt_u32, uint32x2_t, uint32x2_t, uint32x2_t)
// DEF_void_Pd_Pn_Pm(vcgt_p8,  poly8x8_t,  poly8x8_t, poly8x8_t)

// VCLT.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Dd_Dn_Dm(vclt_s8, int8x8_t, int8x8_t, int8x8_t)
DEF_void_Dd_Dn_Dm(vclt_s16, int16x4_t, int16x4_t, int16x4_t)
DEF_void_Dd_Dn_Dm(vclt_s32, int32x2_t, int32x2_t, int32x2_t)
DEF_void_Dd_Dn_Dm(vclt_f32, float32x2_t, float32x2_t, float32x2_t)
DEF_void_Dd_Dn_Dm(vclt_u8,  uint8x8_t,  uint8x8_t,  uint8x8_t)
DEF_void_Dd_Dn_Dm(vclt_u16, uint16x4_t, uint16x4_t, uint16x4_t)
DEF_void_Dd_Dn_Dm(vclt_u32, uint32x2_t, uint32x2_t, uint32x2_t)
// DEF_void_Pd_Pn_Pm(vclt_p8,  poly8x8_t,  poly8x8_t, poly8x8_t)

// VCEQQ.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Qd_Qn_Qm(vceqq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(vceqq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vceqq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(vceqq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(vceqq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(vceqq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(vceqq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
// DEF_void_Pd_Pn_Pm(vceqq_p8,  poly8x16_t,  poly16x8_t, poly16x8_t)

// VCGEQ.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Qd_Qn_Qm(vcgeq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(vcgeq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vcgeq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(vcgeq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(vcgeq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(vcgeq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(vcgeq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
// DEF_void_Pd_Pn_Pm(vcgeq_p8,  poly8x16_t,  poly16x8_t, poly16x8_t)

// VCLEQ.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Qd_Qn_Qm(vcleq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(vcleq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vcleq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(vcleq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(vcleq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(vcleq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(vcleq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
// DEF_void_Pd_Pn_Pm(vcleq_p8,  poly8x16_t,  poly16x8_t, poly16x8_t)

// VCGTQ.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Qd_Qn_Qm(vcgtq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(vcgtq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vcgtq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(vcgtq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(vcgtq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(vcgtq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(vcgtq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
// DEF_void_Pd_Pn_Pm(vcgeq_p8,  poly8x16_t,  poly16x8_t, poly16x8_t)

// VCLTQ.type = s8,s16,s32,f32,u8,u16,u32,p8
DEF_void_Qd_Qn_Qm(vcltq_s8,  int8x16_t, int8x16_t, int8x16_t)
DEF_void_Qd_Qn_Qm(vcltq_s16, int16x8_t, int16x8_t, int16x8_t)
DEF_void_Qd_Qn_Qm(vcltq_s32, int32x4_t, int32x4_t, int32x4_t)
DEF_void_Qd_Qn_Qm(vcltq_f32, float32x4_t, float32x4_t, float32x4_t)
DEF_void_Qd_Qn_Qm(vcltq_u8,  uint8x16_t, uint8x16_t, uint8x16_t)
DEF_void_Qd_Qn_Qm(vcltq_u16, uint16x8_t, uint16x8_t, uint16x8_t)
DEF_void_Qd_Qn_Qm(vcltq_u32, uint32x4_t, uint32x4_t, uint32x4_t)
// DEF_void_Pd_Pn_Pm(vcltq_p8,  poly8x16_t,  poly16x8_t, poly16x8_t)

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




