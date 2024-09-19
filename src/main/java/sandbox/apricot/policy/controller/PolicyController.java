package sandbox.apricot.policy.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/policy")
public class PolicyController {

    @GetMapping("/area")
    public String viewArea(Model model) {
        return "policy/area";
    }
}
