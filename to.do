<p>
    <%= f.label :team %><br />
    <%= f.select :team_id, [['select a team', '']]+@teams.collect {|t| [t.name, t.id]} %>
  </p>