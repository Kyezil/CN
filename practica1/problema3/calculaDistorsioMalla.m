function distorsioMalla = calculaDistorsioMalla(X,T)
% ===> IMPLEMENTAR AQUI EL CALCUL DE LA DISTORSIO DE MALLA <===
	A = [1  -sqrt(3)/3
			0 2*sqrt(3)/3];

	numElements = size(T,1);
	distorsioMalla = 0;
	for e = 1:numElements
			% ===> IMPLEMENTAR AQUI EL CALCUL DE LA DISTORSIO DE L'ELEMENT e <===
			xx = X(T(e,:),:); % (x1;x2;x3)
			xx(2:end,:) -= xx(1,:); % (x1;x2-x1;x3-x1)
			D = A*xx(2:end, :)';
			nor = norm(D, 'fro')^2/(2*abs(det(D)));
			distorsioMalla += nor^2;
	end
	distorsioMalla = sqrt(distorsioMalla);
end

