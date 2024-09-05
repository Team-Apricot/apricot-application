package sandbox.apricot.resume.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/resume")
public class ResumeController {

  @GetMapping("/heonuk")
  public String introHeonUk(Model model) {
    return "developerIntroductionViews/heonuk/intro";
  }

  @GetMapping("/heejung")
  public String introHeeJung(Model model) {
    return "resume/heejung";
  }

  @GetMapping("/seoho")
  public String introSeoHo(Model model) {
    return "developerIntroductionViews/seoho/intro";
  }

  @GetMapping("/seockhyun")
  public String introSeockHyun(Model model) {
    return "resume/seockhyun";
  }

}
