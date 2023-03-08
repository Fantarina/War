defmodule War do
  def deal(listofcards) do
    Enum.map(listofcards,&(convert(&1))) |>
    deals()|>
    fight()|>
    Enum.map(&(convert(&1)))
  end

  #convert the value of the integer to ease our sorting later, atom are always superior to integer
  defp convert(1) do
    :ace
  end
  defp convert(:ace) do
    1
  end
  defp convert(a) do
    a
  end
  #deal each players cards and return a map of the 2 players deck before the start of the war
  defp deals(listofcards) do
    deals(listofcards,[],[])
  end


  #deal one card to player1 then one card to player2 then return a map composed of player1 and player2 decks
  defp deals([],p1,p2) do
    %{player1: p1, player2: p2}
  end

  defp deals([head|rest],p1,p2) when length(p1) == length(p2) do
    deals(rest,[head|p1],p2)
  end

  defp deals([head|rest],p1,p2) do
    deals(rest,p1,[head|p2])
  end


  defp fight(deck) do
    fight(deck.player1,deck.player2,{:up,[]})
  end

  # we first deal with the simple case where there is a higher card adding at the bottom of the winner's pile the new cards
  # in the case a player run out of cards return the winner's deck
  defp fight([top1|p1],[top2|p2],{:up,[]}) when top1 > top2 do
    fight(p1++[top1,top2],p2,{:up,[]})
  end

  defp fight(p1,[],{:up,[]})do
    p1
  end

  defp fight([top1|p1],[top2|p2],{:up,[]}) when top2 > top1 do
    fight(p1,p2++[top2,top1],{:up,[]})
  end

  defp fight([],p2,{:up,[]})do
    p2
  end

  #in case of a tie, we put cards in a tuple {state,cards} waiting for the winner to take it when the state is "up" we expect to send cards facedown next and vice versa
  #We also finish the game whenever a player run out of cards
  defp fight([top1|p1],[top1|p2],{:up,[]}) do
    fight(p1,p2,{:up,[top1,top1]})
  end

  #Here we deal with the face down cards
  defp fight([top1|p1],[top2|p2],{:up,prize}) do
    fight(p1,p2,{:down,[top1,top2]++prize})
  end
  defp fight(p1,[],{:up,prize}) do
    p1 ++ Enum.sort(prize,:desc)
  end
  defp fight([],p2,{:up,prize}) do
    p2++ Enum.sort(prize,:desc)
  end

  #Here we deal with the new fight of face up cards
  defp fight([top1|p1],[top2|p2],{:down,prize}) when top1 > top2 do
    p1= p1++ Enum.sort([top1,top2]++prize,:desc)
    fight(p1,p2,{:up,[]})
  end
  defp fight(p1,[],{:down,prize})do
    p1 ++ Enum.sort(prize,:desc)
  end
  defp fight([top1|p1],[top2|p2],{:down,prize}) when top2 > top1 do
    p2= p2++ Enum.sort([top2,top1]++prize,:desc)
    fight(p1,p2,{:up,[]})
  end
  defp fight([],p2,{:down,prize}) do
    p2++ Enum.sort(prize,:desc)
  end

  #in the case it's tied again we start another round of war
  defp fight([top1|p1],[top1|p2],{:down,prize}) do
    fight(p1,p2,{:up,[top1,top1]++prize})
  end

end
