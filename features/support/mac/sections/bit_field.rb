class BitField < TestCentricity::ScreenSection
  trait(:section_name)    { 'Bit Field section' }
  trait(:section_locator) { { predicate: 'identifier == "_NS:11"' } }

  # Bit Field section UI elements
  labels     bit_0_marker:  { predicate: 'label == "marker for bit 0"' },
             bit_15_marker: { predicate: 'label == "marker for bit 15"' },
             bit_31_marker: { predicate: 'label == "marker for bit 31"' },
             bit_32_marker: { predicate: 'label == "marker for bit 32"' },
             bit_47_marker: { predicate: 'label == "marker for bit 47"' },
             bit_63_marker: { predicate: 'label == "marker for bit 63"' }
  checkboxes bit_0_check:   { predicate: 'identifier == "_NS:547"' },
             bit_1_check:   { predicate: 'identifier == "_NS:372"' },
             bit_2_check:   { predicate: 'identifier == "_NS:90"' },
             bit_3_check:   { predicate: 'identifier == "_NS:269"' },
             bit_4_check:   { predicate: 'identifier == "_NS:277"' },
             bit_5_check:   { predicate: 'identifier == "_NS:42"' },
             bit_6_check:   { predicate: 'identifier == "_NS:24"' },
             bit_7_check:   { predicate: 'identifier == "_NS:207"' },
             bit_8_check:   { predicate: 'identifier == "_NS:563"' },
             bit_9_check:   { predicate: 'identifier == "_NS:388"' },
             bit_10_check:  { predicate: 'identifier == "_NS:444"' },
             bit_11_check:  { predicate: 'identifier == "_NS:215"' },
             bit_12_check:  { predicate: 'identifier == "_NS:452"' },
             bit_13_check:  { predicate: 'identifier == "_NS:183"' },
             bit_14_check:  { predicate: 'identifier == "_NS:341"' },
             bit_15_check:  { predicate: 'identifier == "_NS:229"' },
             bit_16_check:  { predicate: 'identifier == "_NS:380"' },
             bit_17_check:  { predicate: 'identifier == "_NS:199"' },
             bit_18_check:  { predicate: 'identifier == "_NS:428"' },
             bit_19_check:  { predicate: 'identifier == "_NS:571"' },
             bit_20_check:  { predicate: 'identifier == "_NS:50"' },
             bit_21_check:  { predicate: 'identifier == "_NS:356"' },
             bit_22_check:  { predicate: 'identifier == "_NS:114"' },
             bit_23_check:  { predicate: 'identifier == "_NS:579"' },
             bit_24_check:  { predicate: 'identifier == "_NS:555"' },
             bit_25_check:  { predicate: 'identifier == "_NS:364"' },
             bit_26_check:  { predicate: 'identifier == "_NS:484"' },
             bit_27_check:  { predicate: 'identifier == "_NS:74"' },
             bit_28_check:  { predicate: 'identifier == "_NS:253"' },
             bit_29_check:  { predicate: 'identifier == "_NS:245"' },
             bit_30_check:  { predicate: 'identifier == "_NS:122"' },
             bit_31_check:  { predicate: 'identifier == "_NS:138"' },
             bit_32_check:  { predicate: 'identifier == "_NS:420"' },
             bit_33_check:  { predicate: 'identifier == "_NS:317"' },
             bit_34_check:  { predicate: 'identifier == "_NS:191"' },
             bit_35_check:  { predicate: 'identifier == "_NS:154"' },
             bit_36_check:  { predicate: 'identifier == "_NS:531"' },
             bit_37_check:  { predicate: 'identifier == "_NS:285"' },
             bit_38_check:  { predicate: 'identifier == "_NS:539"' },
             bit_39_check:  { predicate: 'identifier == "_NS:436"' },
             bit_40_check:  { predicate: 'identifier == "_NS:396"' },
             bit_41_check:  { predicate: 'identifier == "_NS:333"' },
             bit_42_check:  { predicate: 'identifier == "_NS:325"' },
             bit_43_check:  { predicate: 'identifier == "_NS:130"' },
             bit_44_check:  { predicate: 'identifier == "_NS:82"' },
             bit_45_check:  { predicate: 'identifier == "_NS:293"' },
             bit_46_check:  { predicate: 'identifier == "_NS:404"' },
             bit_47_check:  { predicate: 'identifier == "_NS:146"' },
             bit_48_check:  { predicate: 'identifier == "_NS:515"' },
             bit_49_check:  { predicate: 'identifier == "_NS:500"' },
             bit_50_check:  { predicate: 'identifier == "_NS:237"' },
             bit_51_check:  { predicate: 'identifier == "_NS:476"' },
             bit_52_check:  { predicate: 'identifier == "_NS:58"' },
             bit_53_check:  { predicate: 'identifier == "_NS:301"' },
             bit_54_check:  { predicate: 'identifier == "_NS:261"' },
             bit_55_check:  { predicate: 'identifier == "_NS:523"' },
             bit_56_check:  { predicate: 'identifier == "_NS:468"' },
             bit_57_check:  { predicate: 'identifier == "_NS:492"' },
             bit_58_check:  { predicate: 'identifier == "_NS:98"' },
             bit_59_check:  { predicate: 'identifier == "_NS:412"' },
             bit_60_check:  { predicate: 'identifier == "_NS:66"' },
             bit_61_check:  { predicate: 'identifier == "_NS:106"' },
             bit_62_check:  { predicate: 'identifier == "_NS:460"' },
             bit_63_check:  { predicate: 'identifier == "_NS:309"' }

  def verify_bit_field
    ui = {
      bit_0_marker => {
        value: '0',
        visible: true
      },
      bit_15_marker => {
        value: '15',
        visible: true
      },
      bit_31_marker => {
        value: '31',
        visible: true
      },
      bit_32_marker => {
        value: '32',
        visible: true
      },
      bit_47_marker => {
        value: '47',
        visible: true
      },
      bit_63_marker => {
        value: '63',
        visible: true
      },
      bit_0_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_1_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_2_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_3_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_4_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_5_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_6_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_7_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_8_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_9_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_10_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_11_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_12_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_13_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_14_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_15_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_16_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_17_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_18_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_19_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_20_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_21_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_22_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_23_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_24_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_25_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_26_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_27_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_28_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_29_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_30_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_31_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_32_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_33_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_34_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_35_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_36_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_37_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_38_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_39_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_40_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_41_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_42_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_43_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_44_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_45_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_46_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_47_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_48_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_49_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_50_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_51_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_52_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_53_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_54_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_55_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_56_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_57_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_58_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_59_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_60_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_61_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_62_check => {
        caption: '0',
        checked: false,
        visible: true
      },
      bit_63_check => {
        caption: '0',
        checked: false,
        visible: true
      }
    }
    verify_ui_states(ui)
  end

  def set_bits(bit_data)
    bit_data = bit_data.rjust(64, '0').reverse
    bits = {
      bit_0_check => bit_data[0],
      bit_1_check => bit_data[1],
      bit_2_check => bit_data[2],
      bit_3_check => bit_data[3],
      bit_4_check => bit_data[4],
      bit_5_check => bit_data[5],
      bit_6_check => bit_data[6],
      bit_7_check => bit_data[7],
      bit_8_check => bit_data[8],
      bit_9_check => bit_data[9],
      bit_10_check => bit_data[10],
      bit_11_check => bit_data[11],
      bit_12_check => bit_data[12],
      bit_13_check => bit_data[13],
      bit_14_check => bit_data[14],
      bit_15_check => bit_data[15],
      bit_16_check => bit_data[16],
      bit_17_check => bit_data[17],
      bit_18_check => bit_data[18],
      bit_19_check => bit_data[19],
      bit_20_check => bit_data[20],
      bit_21_check => bit_data[21],
      bit_22_check => bit_data[22],
      bit_23_check => bit_data[23],
      bit_24_check => bit_data[24],
      bit_25_check => bit_data[25],
      bit_26_check => bit_data[26],
      bit_27_check => bit_data[27],
      bit_28_check => bit_data[28],
      bit_29_check => bit_data[29],
      bit_30_check => bit_data[30],
      bit_31_check => bit_data[31],
      bit_32_check => bit_data[32],
      bit_33_check => bit_data[33],
      bit_34_check => bit_data[34],
      bit_35_check => bit_data[35],
      bit_36_check => bit_data[36],
      bit_37_check => bit_data[37],
      bit_38_check => bit_data[38],
      bit_39_check => bit_data[39],
      bit_40_check => bit_data[40],
      bit_41_check => bit_data[41],
      bit_42_check => bit_data[42],
      bit_43_check => bit_data[43],
      bit_44_check => bit_data[44],
      bit_45_check => bit_data[45],
      bit_46_check => bit_data[46],
      bit_47_check => bit_data[47],
      bit_48_check => bit_data[48],
      bit_49_check => bit_data[49],
      bit_50_check => bit_data[50],
      bit_51_check => bit_data[51],
      bit_52_check => bit_data[52],
      bit_53_check => bit_data[53],
      bit_54_check => bit_data[54],
      bit_55_check => bit_data[55],
      bit_56_check => bit_data[56],
      bit_57_check => bit_data[57],
      bit_58_check => bit_data[58],
      bit_59_check => bit_data[59],
      bit_60_check => bit_data[60],
      bit_61_check => bit_data[61],
      bit_62_check => bit_data[62],
      bit_63_check => bit_data[63]
    }
    populate_data_fields(bits)
  end

  def verify_bits(bit_data)
    puts "bit_data = #{bit_data}"
    bit_data = bit_data.to_i(16).to_s(2).rjust(64, '0').reverse
    ui = {
      bit_0_check => { caption: bit_data[0], checked: bit_data[0].to_bool },
      bit_1_check => { caption: bit_data[1], checked: bit_data[1].to_bool },
      bit_2_check => { caption: bit_data[2], checked: bit_data[2].to_bool },
      bit_3_check => { caption: bit_data[3], checked: bit_data[3].to_bool },
      bit_4_check => { caption: bit_data[4], checked: bit_data[4].to_bool },
      bit_5_check => { caption: bit_data[5], checked: bit_data[5].to_bool },
      bit_6_check => { caption: bit_data[6], checked: bit_data[6].to_bool },
      bit_7_check => { caption: bit_data[7], checked: bit_data[7].to_bool },
      bit_8_check => { caption: bit_data[8], checked: bit_data[8].to_bool },
      bit_9_check => { caption: bit_data[9], checked: bit_data[9].to_bool },
      bit_10_check => { caption: bit_data[10], checked: bit_data[10].to_bool },
      bit_11_check => { caption: bit_data[11], checked: bit_data[11].to_bool },
      bit_12_check => { caption: bit_data[12], checked: bit_data[12].to_bool },
      bit_13_check => { caption: bit_data[13], checked: bit_data[13].to_bool },
      bit_14_check => { caption: bit_data[14], checked: bit_data[14].to_bool },
      bit_15_check => { caption: bit_data[15], checked: bit_data[15].to_bool },
      bit_16_check => { caption: bit_data[16], checked: bit_data[16].to_bool },
      bit_17_check => { caption: bit_data[17], checked: bit_data[17].to_bool },
      bit_18_check => { caption: bit_data[18], checked: bit_data[18].to_bool },
      bit_19_check => { caption: bit_data[19], checked: bit_data[19].to_bool },
      bit_20_check => { caption: bit_data[20], checked: bit_data[20].to_bool },
      bit_21_check => { caption: bit_data[21], checked: bit_data[21].to_bool },
      bit_22_check => { caption: bit_data[22], checked: bit_data[22].to_bool },
      bit_23_check => { caption: bit_data[23], checked: bit_data[23].to_bool },
      bit_24_check => { caption: bit_data[24], checked: bit_data[24].to_bool },
      bit_25_check => { caption: bit_data[25], checked: bit_data[25].to_bool },
      bit_26_check => { caption: bit_data[26], checked: bit_data[26].to_bool },
      bit_27_check => { caption: bit_data[27], checked: bit_data[27].to_bool },
      bit_28_check => { caption: bit_data[28], checked: bit_data[28].to_bool },
      bit_29_check => { caption: bit_data[29], checked: bit_data[29].to_bool },
      bit_30_check => { caption: bit_data[30], checked: bit_data[30].to_bool },
      bit_31_check => { caption: bit_data[31], checked: bit_data[31].to_bool },
      bit_32_check => { caption: bit_data[32], checked: bit_data[32].to_bool },
      bit_33_check => { caption: bit_data[33], checked: bit_data[33].to_bool },
      bit_34_check => { caption: bit_data[34], checked: bit_data[34].to_bool },
      bit_35_check => { caption: bit_data[35], checked: bit_data[35].to_bool },
      bit_36_check => { caption: bit_data[36], checked: bit_data[36].to_bool },
      bit_37_check => { caption: bit_data[37], checked: bit_data[37].to_bool },
      bit_38_check => { caption: bit_data[38], checked: bit_data[38].to_bool },
      bit_39_check => { caption: bit_data[39], checked: bit_data[39].to_bool },
      bit_40_check => { caption: bit_data[40], checked: bit_data[40].to_bool },
      bit_41_check => { caption: bit_data[41], checked: bit_data[41].to_bool },
      bit_42_check => { caption: bit_data[42], checked: bit_data[42].to_bool },
      bit_43_check => { caption: bit_data[43], checked: bit_data[43].to_bool },
      bit_44_check => { caption: bit_data[44], checked: bit_data[44].to_bool },
      bit_45_check => { caption: bit_data[45], checked: bit_data[45].to_bool },
      bit_46_check => { caption: bit_data[46], checked: bit_data[46].to_bool },
      bit_47_check => { caption: bit_data[47], checked: bit_data[47].to_bool },
      bit_48_check => { caption: bit_data[48], checked: bit_data[48].to_bool },
      bit_49_check => { caption: bit_data[49], checked: bit_data[49].to_bool },
      bit_50_check => { caption: bit_data[50], checked: bit_data[50].to_bool },
      bit_51_check => { caption: bit_data[51], checked: bit_data[51].to_bool },
      bit_52_check => { caption: bit_data[52], checked: bit_data[52].to_bool },
      bit_53_check => { caption: bit_data[53], checked: bit_data[53].to_bool },
      bit_54_check => { caption: bit_data[54], checked: bit_data[54].to_bool },
      bit_55_check => { caption: bit_data[55], checked: bit_data[55].to_bool },
      bit_56_check => { caption: bit_data[56], checked: bit_data[56].to_bool },
      bit_57_check => { caption: bit_data[57], checked: bit_data[57].to_bool },
      bit_58_check => { caption: bit_data[58], checked: bit_data[58].to_bool },
      bit_59_check => { caption: bit_data[59], checked: bit_data[59].to_bool },
      bit_60_check => { caption: bit_data[60], checked: bit_data[60].to_bool },
      bit_61_check => { caption: bit_data[61], checked: bit_data[61].to_bool },
      bit_62_check => { caption: bit_data[62], checked: bit_data[62].to_bool },
      bit_63_check => { caption: bit_data[63], checked: bit_data[63].to_bool }
    }
    verify_ui_states(ui)
  end
end
