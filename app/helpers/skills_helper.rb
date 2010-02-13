module SkillsHelper
  def display_skill_name(skill, separator = ":")
    skills = [skill]

    while skills.last.parent
      skills << skills.last.parent
    end

    rval = skills.reverse.map{ |skill|
      link_to skill.name, skill_url(skill)

    }.join(separator)

    rval
  end
end
