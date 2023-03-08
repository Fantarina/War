defmodule WarTest do
  use ExUnit.Case
  doctest War

  test "deal_1" do
    t1 = [1,1,1,1,13,13,13,13,11,11,11,11,12,12,12,12,10,10,10,10,9,9,9,9,7,7,7,7,8,8,8,8,6,6,6,6,5,5,5,5,4,4,4,4,3,3,3,3,2,2,2,2]
    r1 = [1,1,1,1,13,13,13,13,12,12,12,12,11,11,11,11,10,10,10,10,9,9,9,9,8,8,8,8,7,7,7,7,6,6,6,6,5,5,5,5,4,4,4,4,3,3,3,3,2,2,2,2]
    assert War.deal(t1) == r1
  end

  test "deal_2" do
    t2 = [1,13,1,13,1,13,1,13,12,11,12,11,12,11,12,11,10,9,10,9,10,9,10,9,8,7,8,7,8,7,8,7,6,5,6,5,6,5,6,5,4,3,4,3,4,3,4,3,2,2,2,2]
    r2 = [4,3,2,2,2,2,4,3,4,3,4,3,6,5,6,5,6,5,6,5,8,7,8,7,8,7,8,7,10,9,10,9,10,9,10,9,12,11,12,11,12,11,12,11,1,13,1,13,1,13,1,13]
    assert War.deal(t2) == r2
  end

  test "deal_3" do
    t3 = [13,1,13,1,13,1,13,1,11,12,11,12,11,12,11,12,9,10,9,10,9,10,9,10,7,8,7,8,7,8,7,8,5,6,5,6,5,6,5,6,3,4,3,4,3,4,3,4,2,2,2,2]
    r3 = [4,3,2,2,2,2,4,3,4,3,4,3,6,5,6,5,6,5,6,5,8,7,8,7,8,7,8,7,10,9,10,9,10,9,10,9,12,11,12,11,12,11,12,11,1,13,1,13,1,13,1,13]
    assert War.deal(t3) == r3
  end

  test "deal_4" do
    t4 = [10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9]
    r4 = [1,1,13,12,9,5,11,4,9,3,8,7,7,2,13,10,12,5,10,4,9,6,8,3,1,1,13,12,7,5,11,4,9,3,8,6,7,2,13,10,12,5,11,11,10,8,6,4,6,3,2,2]
    assert War.deal(t4) == r4
  end

  test "deal_5" do
    t5 = [1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3,4,5,6,7,8,9,10,11,12,13]
    r5 = [1,10,13,8,11,9,8,7,11,8,13,7,13,6,12,6,9,5,8,5,7,4,7,4,11,6,12,10,6,3,2,2,12,5,9,3,10,4,9,2,10,3,5,2,1,1,1,13,12,11,4,3]
    assert War.deal(t5) == r5
  end

  test "p1_win_every_fight" do
    t6 = [1,2,1,2,4,3,4,3]
    r6 = [4,3,4,3,1,2,1,2]
    assert War.deal(t6) == r6
  end

  test "p1_lose_after_war" do
    t7 = [2,11,13,1,1,1]
    r7 = [1,1,1,13,11,2]
    assert War.deal(t7) == r7
  end

  test "war_after_war" do
    t8 = [8,9,1,3,11,11,13,1,1,1]
    r8 = [1,1,1,1,13,11,11,9,8,3]
    assert War.deal(t8) == r8
  end

  test "p1_winafight_after_waw" do
    t9 = [7,5,8,9,1,3,11,11,13,1,1,1]
    r9 = [1,1,13,11,11,9,8,3,1,7,1,5]
    assert (War.deal(t9)) == r9
  end


  test "p1_winafight_befor_and_after_waw" do
    t10 = [7,5,8,9,1,3,11,11,13,1,1,1,10,9]
    r10= [13,11,11,9,8,3,1,10,1,9,1,7,1,5]
    assert War.deal(t10) == r10
  end

end