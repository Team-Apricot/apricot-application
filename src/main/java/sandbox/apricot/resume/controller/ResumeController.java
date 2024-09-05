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
        return "resume/heonuk";
    }

    @GetMapping("/heejung")
    public String introHeeJung(Model model) {
        return "resume/heejung";
    }

    @GetMapping("/seoho")
    public String introSeoHo(Model model) {
        return "resume/seoho";
    }

    @GetMapping("/seokhyun/home")
    public String introSeokHyunHome(Model model) {
        return "resume/seokhyun/home";
    }

    @GetMapping("/seokhyun/about")
    public String introSeokHyunAbout(Model model) {
        return "resume/seokhyun/about";
    }
    @GetMapping("/seokhyun/resume")
    public String introSeokHyunResume(Model model) {
        return "resume/seokhyun/resume";
    }
}
